{ pkgs, config, ...}: {
    programs.vscode.enable = true;
    programs.vscode.extensions = with pkgs.vscode-extensions; [
        # Nix language support
        bbenoist.nix 
        # IntelliSense (Pylance), Linting, ...
        ms-python.python 
        # Open any folder or repository inside a Docker container
        ms-vscode-remote.remote-containers 
        # Open any folder on a remote machine using SSH
        ms-vscode-remote.remote-ssh 
        # Edit Excel spreadsheets and CSV files
        grapecity.gc-excelviewer 
        # Intelligent Tailwind CSS tooling
        bradlc.vscode-tailwindcss
        # Kubernetes 
        ms-kubernetes-tools.vscode-kubernetes-tools
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # Dark theme
        {
            name = "kamil-now-black-theme"; 
            publisher = "kamil-now";
            version = "0.0.2";
            sha256 = "VbzXis9BUBknXOTKR4TBulogMjzvWYDGqAOd4gXdZe4=";
        }
        # Import Sublime Text settings and keybindings into VS Code
        {
            name = "sublime-keybindings"; 
            publisher = "ms-vscode";
            version = "4.1.10";
            sha256 = "XlogenuBmP+tE18VLH4lUSpOq/7d022n8HgXnKjY3n0=";
        }
        # Autocomplete CSS Variable support CSS, SCSS, LESS, PostCSS, VueJS, ReactJS and more
        {
            name = "vscode-css-variables";
            publisher = "vunguyentuan";
            version = "2.7.1";
            sha256 = "orcV+t8I2hMjN/iKykEK4OyXyyCDMYo9UXm206b2S78=";
        } 
    ];
}