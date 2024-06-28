{ pkgs, config, ...}: {
    home.packages = with pkgs; [
        retry
        zip
        unzip
    ];
}