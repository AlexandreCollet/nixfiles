{ config, pkgs, ... }:

let
  azureStorageExplorer = pkgs.stdenv.mkDerivation {
    name = "azure-storage-explorer";
    src = pkgs.fetchurl {
      url = "https://github.com/microsoft/AzureStorageExplorer/releases/download/v1.32.0/StorageExplorer-linux-x64.tar.gz";
      sha256 = "0x6j02i3gi0fy6a3izn7dwml9q9jv1k4ymp8jghw7kqc8ygaz1c8";
    };
    buildInputs = [
      pkgs.libX11
      pkgs.libXcomposite
      pkgs.libXcursor
      pkgs.libXdamage
      pkgs.libXi
      pkgs.libXtst
      pkgs.gtk3
      pkgs.glib
      pkgs.gnome3.dconf
      pkgs.libnotify
      pkgs.libXScrnSaver
      pkgs.nss
    ];
    installPhase = ''
      mkdir -p $out/bin
      cp -r * $out/bin
    '';
  };
in
{
  home.packages = [
    azureStorageExplorer
  ];

  xdg.desktops = {
    "azure-storage-explorer" = {
      name = "Azure Storage Explorer";
      exec = "~/.nix-profile/bin/azure-storage-explorer";
      icon = "~/.nix-profile/bin/resources/app/out/app/icon.png";
      categories = [ "Utility" ];
    };
  };
}