{ pkgs, config, ...}: {
    programs.rofi.enable = true;
    programs.rofi.package = pkgs.rofi-wayland;
    programs.rofi.extraConfig = {
        /* Highlight an entry under the mouse pointer */
        hover-select = true;

        /* Disable MousePrimary as an entry selector */
        /* Without this setting you won't be able to set MousePrimary as an entry
            acceptor. */
        me-select-entry = "";

        /* Use either LMB single click or RMB single click or LMB double click
            to accept an entry */
        me-accept-entry = [ "MousePrimary" "MouseSecondary" "MouseDPrimary" ];
    };
    programs.rofi.theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
    in {
        "*" = {
            margin = 0;
            padding = 0;
            spacing = 0;
            font = "DejaVuSans Mono 12";
        };
        "listview" = {
            spacing = 0;
            scrollbar = true;
            margin =0;
            dynamic = true;
            background-color = mkLiteral "#000000";
            columns = 4;
        };
        "window" = {
            fullscreen = true;
            transparency = "real";
            background-color = mkLiteral "#000000";
        };
        "mainbox" = {
            margin = mkLiteral "10% 10% 10% 10%";
            border = 0;
            padding = 0;
            background-color = mkLiteral "#000000";
            children = map mkLiteral [ "mode-switcher" "inputbar" "listview" ];
        };
        "mode-switcher" = {
            background-color = mkLiteral "#000000";
        };
        "button" = {
            background-color = mkLiteral "#000000";
            text-color = mkLiteral "#ffffff";
            padding = 4;
        };
        "button selected" = {
            background-color = mkLiteral "#ffffff";
            text-color = mkLiteral "#000000";
        };
        "element" = {
            padding = 16;
            background-color = mkLiteral "#000000";
            text-color = mkLiteral "#ffffff";
        };
        "element-text" = {
            background-color = mkLiteral "#000000";
            text-color = mkLiteral "#ffffff";
        };
        "element.selected.normal" = {
            text-color = mkLiteral "#ffffff";
            border-radius = 0;
            border = 2;
            border-color = mkLiteral "#ffffff";
        };
        "inputbar" = {
            border = 0;
            padding = 0;
            margin = mkLiteral "0 0 10% 0";
            spacing = 0;
            orientation = mkLiteral "vertical";
            background-color = mkLiteral "#000000";
            children = map mkLiteral [ "entry" ];
        };
        "entry" = {
            padding = 8;
            horizontal-align = mkLiteral "0.5";
            border = 2;
            border-color = mkLiteral "#ffffff";
            background-color = mkLiteral "#000000";
            text-color = mkLiteral "#ffffff";
        };
        "scrollbar" = {
            border = 0;
            width = 0;
            handle-color = mkLiteral "#000000";
            handle-width = 0;
            background-color = mkLiteral "#000000";
        };
    };
}