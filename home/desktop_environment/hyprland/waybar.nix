{ config, pkgs, ... }:
{
    home.packages = with pkgs; [
        hyprshade
    ];
    
    programs.waybar.enable = true;
    programs.waybar.settings = {
        mainBar = {
            layer = "top";
            position = "top";
            height = 25;
            margin-bottom= 0;
            margin-top = 5;
            margin-left = 5;
            margin-right = 5;
            modules-left = [ 
                "hyprland/workspaces" 
            ];
            modules-center = [

            ];
            modules-right = [ 
                "bluetooth"
                "network"
                "custom/dot"
                "backlight"
                "custom/dot"
                "pulseaudio"
                "custom/dot"
                "battery"
                "custom/dot"
                "clock"
                "custom/powermenu"
            ];
            "hyprland/workspaces" =  {
                active-only = false;
                all-outputs = false;
                format = "{icon}";
                format-icons = {
                    web = "";
                    code = "󰨞";
                    term = "";
                    postman = "";
                    mail = "";
                    spotify = "";
                    health = "";
                    cheatsheet = "";
                };
                show-special = false;
                sort-by = "DEFAULT";
            };
            clock = {
                tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                format-alt = "{:%Y-%m-%d}";
            };
            backlight = {
                format = "{icon} {percent}%";
                format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󰛨"];
                tooltip = false;
                on-click = "hyprshade toggle blue-light-filter";
            };
            battery = {
                states = {
                    warning = 30;
                    critical = 15;
                };
                format = "{icon} {capacity}%";
                format-charging = " {capacity}%";
                format-plugged = " {capacity}%";
                format-icons = ["" "" "" "" ""];
            };
            network = {
                format-wifi = "";
                format-ethernet = "";
                format-linked = "";
                format-disconnected = " Disconnected";
                tooltip-format = "{ifname}: {ipaddr}/{cidr}";
                on-click = "kitty nmtui";
            };
            pulseaudio = {
                scroll-step = 0.5;
                format = "{icon} {volume}% {format_source}";
                format-bluetooth = "{icon} {volume}% {format_source}";
                format-bluetooth-muted = "{icon}  {format_source}";
                format-muted = " {format_source}";
                format-source = " {volume}%";
                format-source-muted = "";
                format-icons = {
                    headphone = "";
                    hands-free = "";
                    headset = "";
                    phone = "";
                    portable = "";
                    car = "";
                    default = ["" "" ""];
                };
                on-click = "pavucontrol";
            };
            bluetooth = {
                format = "󰂯";
                on-click = "blueberry";
            };
            "custom/powermenu" = {
                format = "";
                on-click = "bash ~/nixfiles/home/desktop_environment/hyprland/rofi/powermenu.sh";
            };
            "custom/dot" = {
                format = "•";
                tooltip = false;
            };
            # "custom/spotify_song": {
            #     "exec-if": "pgrep spotify",
            #     "exec": "playerctl --player=\"spotify\" metadata --format \"{{ artist }}: {{ title }}\"",
            #     "interval": 1,
            #     "on-click": "swaymsg '[class=\"Spotify\"] focus'"
            # },
            # "custom/spotify_previous": {
            #     "exec-if": "pgrep spotify",
            #     "exec": "echo \"\"",
            #     "interval": 1,
            #     "on-click": "playerctl --player=\"spotify\" previous"
            # },
            # "custom/spotify_next": {
            #     "exec-if": "pgrep spotify",
            #     "exec": "echo \"\"",
            #     "interval": 1,
            #     "on-click": "playerctl --player=\"spotify\" next"
            # },
            # "custom/spotify_playpause": {
            #     "exec-if": "pgrep spotify",
            #     "exec": "playerctl --player=\"spotify\" status | grep -q \"Playing\" && echo \"\" || echo \"\"",
            #     "interval": 1,
            #     "on-click": "playerctl --player=\"spotify\" play-pause"
            # },
        };
    };
    programs.waybar.style = ''
        * {
            border: none;
            border-radius: 0;
            font-family: DejaVuSans, Roboto, "FiraCode Nerd Font Propo", Helvetica, Arial, sans-serif;
            font-size: 12px;
            font-weight: bold;
            min-height: 0;
        }

        window#waybar {
            background-color: #000000;
            color: #ffffff;
            transition-property: background-color;
            transition-duration: .5s;
            border-radius: 5px;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        window#waybar.chromium {
            background-color: #000000;
            border: none;
        }

        #workspaces button {
            padding: 0 5px;
            background-color: transparent;
            color: #ffffff;
            /* Use box-shadow instead of border so the text isn't offset */
            box-shadow: inset 0 -3px transparent;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        #workspaces button:hover {
            background: rgba(0, 0, 0, 1);
            box-shadow: inset 0 -3px #ffffff;
        }

        #workspaces button.active {
            color: #7EBAE4;
            box-shadow: inset 0 -3px #7EBAE4;
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        #mode {
            background-color: #0091ff;
            border-bottom: 3px solid #ffffff;
        }

        #clock,
        #battery,
        #backlight,
        #pulseaudio,
        #custom-dot,
        #mode {
            margin: 0 8px;
            color: #ffffff;
        }

        #network,
        #custom-bluetooth,
        #custom-nightmode,
        #custom-email {
            margin: 0 4px;
        }


        #window,
        #workspaces {
            margin: 0 4px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }


        #battery.charging, #battery.plugged {
            color: #26A65B;
        }

        #battery.warning:not(.charging) {
            color: #f5703c;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        #battery.critical:not(.charging) {
            color: #f53c3c;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        #network.disconnected {
            color: #f53c3c;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        #pulseaudio.muted {
            background-color: #90b1b1;
            color: #2a5c45;
        }

        #custom-spotify_song {
            margin-right: 16px;
        }
        #custom-spotify_previous,
        #custom-spotify_playpause {
            margin-right: 8px;
        }

        #custom-email.active {
            color: #3b84c0;
        }

        #custom-email.inactive {
            color: #ffffff;
        }

        #bluetooth.off, #bluetooth.disabled {
            color: red;
        }
        #bluetooth.on {
            color: green;
        }
        #bluetooth.connected {
            color: blue;
        }

        @keyframes blink {
            to {
                color: #000000;
            }
        }
    '';
}