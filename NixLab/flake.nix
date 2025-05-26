{
  description = "🧼 Clean, portable sandboxed Bash dev shell (non-graphical, flake-based)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # 🏠 Embed the fake HOME structure from ./fake-home-template
        fakeHome = pkgs.runCommand "fake-home" { } ''
          mkdir -p $out
          cp -rT ${self + "/fake-home-template"} $out
        '';
      in {
        devShells.default = pkgs.mkShell {
          name = "ephemeral-bash-home";

          packages = with pkgs; [
            bashInteractive
            starship
            direnv
            coreutils
            findutils
            gnugrep
            curl
            git
            fzf
            bat
            htop
            tree
            ncurses  # ← 🧽 Needed for `clear` command
          ];

          shellHook = ''
            echo "[🏗️  Setting up isolated environment...]"

            export PATH="${
              pkgs.lib.concatStringsSep ":" (builtins.map (pkg: "${pkg}/bin") [
                pkgs.coreutils
                pkgs.findutils
                pkgs.gnugrep
                pkgs.direnv
                pkgs.starship
                pkgs.git
                pkgs.fzf
                pkgs.bat
                pkgs.htop
                pkgs.tree
                pkgs.bashInteractive
                pkgs.ncurses
              ])
            }"

            # 📦 Setup ephemeral HOME
            export HOME=$(mktemp -d /tmp/nix-fake-home-XXXX)
            cp -rT ${fakeHome} "$HOME"
            chmod -R u+rw "$HOME"
            mkdir -p "$HOME/.cache/starship"

            # ✨ Enable Starship
            export STARSHIP_CONFIG="$HOME/.config/starship.toml"
            eval "$(starship init bash)"

            # ⏫ Simulate login shell
            [ -f "$HOME/.bash_profile" ] && source "$HOME/.bash_profile"

            # 🧼 Clean up on exit
            trap "rm -rf $HOME" EXIT

           echo "[Using fake HOME: $HOME]"

            # 🔍 Check availability of commands
            #all_ok=true
            #for cmd in starship direnv git fzf bat htop tree clear; do
            #  if command -v $cmd >/dev/null; then
            #    echo "[✅ $cmd available]"
            #  else
            #    echo "[❌ $cmd not found]"
            #    all_ok=false
            #  fi
            # done

            #if [ "$all_ok" = true ]; then
            #  echo "🎉 All tools are available. sandboxed environment ready!"
            #else
            #  echo "⚠️ Some tools are missing. Check flake.nix packages."
            #fi
          '';
        };
      });
}
