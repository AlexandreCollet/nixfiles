{ config, pkgs, inputs, ... }:
{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
        ];

    # Nixos
    system.stateVersion = "23.11";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.tmp.cleanOnBoot = true;

    # Networking
    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;
    networking.hosts = {
        "127.0.0.1" = [
            "l2r.local"
            "api.l2r.local"
            "storybook.l2r.local"
            "emails.l2r.local"
        ];
    };

    # Time
    time.timeZone = "Europe/Paris";

    # I18n
    i18n.defaultLocale = "fr_FR.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
    };

    # Desktop Environments
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    programs.hyprland.enable = true;
    security.pam.services.hyprlock = {};


    # Keyboard
    services.xserver.xkb.layout = "fr";
    services.xserver.xkb.variant = "";
    console.keyMap = "fr";

    # Printing
    services.printing.enable = true;

    # Bluetooth
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;

    # Sound
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };


    # Users
    users.users.alexandrec = {
        isNormalUser = true;
        description = "Alexandre Collet";
        extraGroups = [ "networkmanager" "wheel" "docker"];
    };

    # Virtualisation
    virtualisation.docker.enable = true;
    virtualisation.docker.autoPrune.enable = true;
    virtualisation.docker.autoPrune.dates = "weekly";
    virtualisation.docker.autoPrune.flags = [ "--all" "--volumes" ];

    # Packages
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [ git ];

    # Fonts
    fonts.packages = with pkgs; [ fira-code-nerdfont ];

}
