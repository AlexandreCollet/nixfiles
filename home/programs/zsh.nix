{ pkgs, lib, config, ...}: {
    home.packages = with pkgs; [
        # A modern, maintained replacement for ls.
        eza
     ];

    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        autocd = true;

        shellAliases = {
            update = "sudo nixos-rebuild switch --flake ~/nixfiles/.#lenovo-p14s";
            ls = "eza -la --group-directories-first --git --icons";
            tree = "eza -Ta --group-directories-first --git --icons";
            grep = "grep --color";
        };

        history.size = 10000;
        history.path = "${config.xdg.dataHome}/zsh/history";
        history.share = true;
        history.ignoreDups = true;
        history.ignoreAllDups = true;
        history.expireDuplicatesFirst = true;

        historySubstringSearch.enable = true;
        historySubstringSearch.searchUpKey = "^[[A";
        historySubstringSearch.searchDownKey = "^[[B";

        initExtra = ''
            setopt ALWAYS_TO_END
            setopt AUTO_LIST
            setopt AUTO_MENU
            setopt INC_APPEND_HISTORY

            zstyle ':completion:*' menu select

            bindkey "^[[3~" delete-char   # Touche Suppr
            bindkey "^[[H" beginning-of-line  # Touche Début
            bindkey "^[[F" end-of-line        # Touche Fin
        '';
    };

    programs.starship.enable = true;
    programs.starship.settings = {
        add_newline = true;
        format = lib.concatStrings [
            # Left 
            "$os"
            " "
            "$directory"
            "$git_branch"
            "$git_state"
            "$git_metrics"
            "$git_status"
            # Right
            "$fill"
            "$status"
            "$cmd_duration"
            "$line_break"
            # Second Line
            "$container"
            "$character"
        ];
        fill.symbol = " ";
        os.disabled = false;
        os.style = "bold #5277C3";
        directory.truncation_length = 10;
        directory.style = "bold #7EBAE4";
        character.success_symbol = "[](bold white) ";
        character.error_symbol = "[](bold red) ";
        cmd_duration.min_time = 100;
        cmd_duration.show_milliseconds = true;
        cmd_duration.style = "bold #5277C3";
        status.disabled = false;
        git_branch.format = "[$symbol](bold #5277C3)[$branch(:$remote_branch)](bold white) ";
        git_metrics.disabled = false;
        git_metrics.format = "([+]($added_style)$added )([-]($deleted_style)$deleted )";
        git_metrics.added_style = "#7EBAE4";
        git_metrics.deleted_style = "#7EBAE4";
        git_status.style = "bold #5277C3";

        # Symbols
        aws.symbol = "  ";
        buf.symbol = " ";
        c.symbol = " ";
        conda.symbol = " ";
        crystal.symbol = " ";
        dart.symbol = " ";
        directory.read_only = " 󰌾";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        fennel.symbol = " ";
        fossil_branch.symbol = " ";
        git_branch.symbol = " ";
        golang.symbol = " ";
        guix_shell.symbol = " ";
        haskell.symbol = " ";
        haxe.symbol = " ";
        hg_branch.symbol = " ";
        hostname.symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        kotlin.symbol = " ";
        lua.symbol = " ";
        memory_usage.symbol = "󰍛 ";
        meson.symbol = "󰔷 ";
        nim.symbol = "󰆥 ";
        nix_shell.symbol = " ";
        nodejs.symbol = " ";
        ocaml.symbol = " ";
        os.symbols.Alpaquita = " ";
        os.symbols.Alpine = " ";
        os.symbols.AlmaLinux = " ";
        os.symbols.Amazon = " ";
        os.symbols.Android = " ";
        os.symbols.Arch = " ";
        os.symbols.Artix = " ";
        os.symbols.CentOS = " ";
        os.symbols.Debian = " ";
        os.symbols.DragonFly = " ";
        os.symbols.Emscripten = " ";
        os.symbols.EndeavourOS = " ";
        os.symbols.Fedora = " ";
        os.symbols.FreeBSD = " ";
        os.symbols.Garuda = "󰛓 ";
        os.symbols.Gentoo = " ";
        os.symbols.HardenedBSD = "󰞌 ";
        os.symbols.Illumos = "󰈸 ";
        os.symbols.Kali = " ";
        os.symbols.Linux = " ";
        os.symbols.Mabox = " ";
        os.symbols.Macos = " ";
        os.symbols.Manjaro = " ";
        os.symbols.Mariner = " ";
        os.symbols.MidnightBSD = " ";
        os.symbols.Mint = " ";
        os.symbols.NetBSD = " ";
        os.symbols.NixOS = " ";
        os.symbols.OpenBSD = "󰈺 ";
        os.symbols.openSUSE = " ";
        os.symbols.OracleLinux = "󰌷 ";
        os.symbols.Pop = " ";
        os.symbols.Raspbian = " ";
        os.symbols.Redhat = " ";
        os.symbols.RedHatEnterprise = " ";
        os.symbols.RockyLinux = " ";
        os.symbols.Redox = "󰀘 ";
        os.symbols.Solus = "󰠳 ";
        os.symbols.SUSE = " ";
        os.symbols.Ubuntu = " ";
        os.symbols.Unknown = " ";
        os.symbols.Void = " ";
        os.symbols.Windows = "󰍲 ";
        package.symbol = "󰏗 ";
        perl.symbol = " ";
        php.symbol = " ";
        pijul_channel.symbol = " ";
        python.symbol = " ";
        rlang.symbol = "󰟔 ";
        ruby.symbol = " ";
        rust.symbol = " ";
        scala.symbol = " ";
        swift.symbol = " ";
        zig.symbol = " ";
    };
}