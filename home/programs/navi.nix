{ pkgs, lib, config, ...}:
with lib;
let

    configDir = if pkgs.stdenv.isDarwin then
        "Library/Application Support"
    else
        config.xdg.configHome;

    repositories = [
        { github_user="denisidoro"; repository_name="cheats"; }
        { github_user="logiroad"; repository_name="l2r-navi"; } # this will not work on reinstall, require ssh key
    ];

in {
    programs.navi.enable = true;
    programs.navi.enableBashIntegration = false;
    programs.navi.enableZshIntegration = false;
    programs.navi.enableFishIntegration = false;
    programs.navi.settings = {
        style.tag.color = "dark_blue";
        style.tag.width_percentage = 20;
        style.comment.color = "white";
        style.comment.width_percentage = 40;
        style.snippet.color = "dark_grey";
        style.snippet.width_percentage = 40;
        shell = {
            command = "zsh";
        };
    };

    # home.activation.navi-clone-repositories = hm.dag.entryAfter [ "installPackages" ] ''
    #     PATH="${pkgs.navi}/bin:${pkgs.git}/bin:${pkgs.openssh}/bin:$PATH"
    #     ${configDir}/navi/repositories.sh clone_all
    # '';

    # systemd.user.timers.navi-pull-repositories = {
    #     Unit = {
    #         Description = "Call navi-pull-repositories.service 5 minutes after boot and each hour.";
    #     };
    #     Install = {
    #         WantedBy = ["timers.target"];
    #     };
    #     Timer = {
    #         OnBootSec = "5m";
    #         OnUnitActiveSec = "2h";
    #     };
    # };

    # systemd.user.services.navi-pull-repositories = {
    #     Unit = {
    #         Description = "Pull all navi repositories.";
    #     };
    #     Service = {
    #         ExecStart = "${configDir}/navi/repositories.sh pull_all";
    #     };
    # };

    home.file."${configDir}/navi/repositories.sh" = {
        enable = true;
        executable = true;
        text = ''
            #!/usr/bin/env bash

            clone () {
                github_user=$1
                repository_name=$2

                repository_url="git@github.com:''${github_user}/''${repository_name}.git"
                cheatsheet_directory="$(navi info cheats-path)/''${github_user}__''${repository_name}"

                echo "Deleting previous directory"
                rm -rf $cheatsheet_directory

                echo "Cloning ''${repository_url} to ''${cheatsheet_directory}"
                git clone $repository_url $cheatsheet_directory
            }

            pull () {
                github_user=$1
                repository_name=$2

                cheatsheet_directory="$(navi info cheats-path)/''${github_user}__''${repository_name}"

                echo "Pull ''${cheatsheet_directory}"

                git -C $cheatsheet_directory pull
            }

            clone_all () {
                ${concatStringsSep "\n" (
                    map (
                        repo: "clone ${repo.github_user} ${repo.repository_name}"
                    ) repositories
                )}
            }

            pull_all () {
                ${concatStringsSep "\n" (
                    map (
                        repo: "pull ${repo.github_user} ${repo.repository_name}"
                    ) repositories
                )}
            }


            case $1 in
                clone)
                    clone "''${@:2}"
                    ;;
                pull)
                    pull "''${@:2}"
                    ;;
                pull_all)
                    pull_all
                    ;;
                clone_all)
                    clone_all
                    ;;
                *)
                    echo "Unknown action"
                    ;;
            esac
        '';
    };

    home.file."${configDir}/navi/pull_repositories.sh" = {
        enable = true;
        executable = true;
        text = ''
            #!/usr/bin/env bash

            ${concatStringsSep "\n" (
                map (
                    repo: "${configDir}/navi/repositories.sh pull ${repo.github_user} ${repo.repository_name}"
                ) repositories
            )}
        '';
    };
}