{ pkgs, config, ...}: {
    programs.git = {
        enable = true;
        lfs.enable = true;

        userName  = "Alexandre Collet";
        userEmail = "3273308+AlexandreCollet@users.noreply.github.com";

        extraConfig = {
            core = {
                editor = "vim";
            };
            init = {
                defaultBranch = "main";
            };
        };
    };
}