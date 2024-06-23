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
                path = "~/nixfiles/wallpaper.jpg";
            }
        ];

        label = [
            {
                monitor = "";
                position = "0, 300";
                halign = "center";
                valign = "center";
                text = "$TIME";
                text_align = "center";
                color = "rgb(200, 200, 200)";
                font_size = 75;
            }
        ];

        input-field = [
            {
                monitor = "";
                position = "0, 0";
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