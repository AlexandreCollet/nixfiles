{ pkgs, config, ...}: {
    programs.kitty.enable = true;
    programs.kitty.settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        window_padding_width = 5;
        shell = "zsh";
    };
}