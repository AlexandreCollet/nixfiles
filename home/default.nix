{ config, pkgs, ... }:
{
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;

    home.username = "alexandrec";
    home.homeDirectory = "/home/alexandrec";

    imports = [
        ./programs
        ./desktop_environment
    ];
}
