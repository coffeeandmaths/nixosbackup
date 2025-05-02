{config, pkgs, ...}:

{

#----------------STARSHIP--------------------------
   programs.starship = {
     enable = true;
     settings = {
       add_newline = false;
       format = "$all";

       # Optional: customize prompt symbol or modules here
       username = {
         style_user = "bold green";
         style_root = "bold red";
         format = "[$user]($style) ";
         show_always = true;
       };
       hostname = {
         format = "on [$hostname](bold yellow) ";
         ssh_only = false;
       };
       directory = {
         style = "cyan";
       };
       character = {
         success_symbol = "[➜](bold green)";
         error_symbol = "[✗](bold red)";
       };
     };
 };
 }