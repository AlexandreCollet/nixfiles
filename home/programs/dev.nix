{ pkgs, config, ...}: {
    home.packages = with pkgs; [
        pgcli
        postman
    ];
}