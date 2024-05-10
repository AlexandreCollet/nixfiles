{ pkgs, config, ...}: {
    programs.navi.enable = true;
    programs.navi.enableBashIntegration = false;
    programs.navi.enableZshIntegration = false;
    programs.navi.enableFishIntegration = false;
    programs.navi.settings = {};
}