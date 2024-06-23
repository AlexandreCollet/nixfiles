{ config, pkgs, inputs, ... }:
{
    imports = [
        ./hyprland
        ./waybar.nix
        ./rofi
        ./hyprlock.nix
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