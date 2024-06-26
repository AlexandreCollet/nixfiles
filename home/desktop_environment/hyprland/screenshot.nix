{ config, pkgs, ... }:
let

    configDir = if pkgs.stdenv.isDarwin then
        "Library/Application Support"
    else
        config.xdg.configHome;

in {
    home.packages = with pkgs; [
        grim
        slurp
        swappy
    ];

    home.file."${configDir}/swappy/config" = {
        enable = true;
        text = ''
            [Default]
                save_dir=$HOME/Images/screenshots/
                save_filename_format=screenshot-%Y%m%d-%H%M%S.png
                show_panel=false
                line_size=5
                text_size=20
                text_font=sans-serif
                paint_mode=brush
                early_exit=true
                fill_shape=false
        '';
    };
}