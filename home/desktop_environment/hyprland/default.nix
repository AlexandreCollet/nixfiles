{ config, pkgs, inputs, ... }:
{
    imports = [
        ./hyprland
        ./waybar.nix
        ./rofi
    ];

    home.packages = with pkgs; [
        # PulseAudio Volume Control
        pavucontrol
        # Bluetooth configuration tool
        blueberry
    ];
}