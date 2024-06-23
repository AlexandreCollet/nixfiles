{ pkgs, lib, config, ...}: {
    programs.hyprlock.enable = true;
    programs.hyprlock.settings = {
        general = {
            disable_loading_bar = true;
            hide_cursor = false;
            grace = 0;
            no_fade_in = false;
            no_fade_out = false;
            ignore_empty_input = true;
            pam_module = "hyprlock";
            text_trim = true;
        };

        background = [
            {
                monitor = "";
                path = "~/nixfiles/wallpaper.png";
            }
        ];

        image = [
            {
                monitor = "";
                position = "0, 80";
                halign = "center";
                valign = "center";
                path = "~/nixfiles/avatar.jpg";
                size = 160;
                rounding = -1;
                border_size = 3;
                border_color = "rgb(24, 25, 38)";
            }
        ];

        input-field = [
            {
                monitor = "";
                position = "0, -80";
                size = "400, 50";
                dots_center = true;
                fade_on_empty = false;
                font_color = "rgb(200, 200, 200)";
                inner_color = "rgb(10, 10, 10)";
                outer_color = "rgb(24, 25, 38)";
                outline_thickness = 3;
                placeholder_text = "<i>Password</i>";
                shadow_passes = 2;
            }
        ];
    };
}