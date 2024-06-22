{ config, pkgs, inputs, ... }:
{
    imports = [
        ./hyprland
        ./waybar.nix
        ./rofi
        ./screenshot.nix
    ];

    home.packages = with pkgs; [
        # PulseAudio Volume Control
        pavucontrol
        # Bluetooth configuration tool
        blueberry
        # Wayland clipboard utilities
        wl-clipboard
    ];
}