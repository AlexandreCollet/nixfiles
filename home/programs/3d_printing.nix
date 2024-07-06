{ pkgs, config, ...}: {
    home.packages = with pkgs; [
        bambu-studio
    ];
}