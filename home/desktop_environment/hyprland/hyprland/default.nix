{ pkgs, config, ...}: {
    home.packages = with pkgs; [
        # Read socket for monitors
        socat
        # A lightweight and flexible command-line JSON processor
        jq
    ];

    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.extraConfig = ''
        ${builtins.readFile ./hyprland.conf}
    '';
}