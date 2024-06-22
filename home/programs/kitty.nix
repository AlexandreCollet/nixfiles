{ pkgs, config, ...}: {
    programs.kitty.enable = true;
    programs.kitty.settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        window_padding_width = 5;
        shell = "zsh";
        background            = "#000000";
        foreground            = "#d6dae4";
        cursor                = "#b9b9b9";
        selection_background  = "#d6dae4";
        selection_foreground  = "#000000";
    };
}