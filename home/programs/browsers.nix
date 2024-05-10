{ pkgs, config, ...}: {
    programs.firefox.enable = true;
    home.packages = with pkgs; [
        google-chrome
        microsoft-edge
    ];
}