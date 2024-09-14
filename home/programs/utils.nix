{ pkgs, config, ...}: {
    home.packages = with pkgs; [
        htop
        rclone
        retry
        zip
        unzip
    ];
}
