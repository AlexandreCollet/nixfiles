{ pkgs, config, ...}: {
    programs.vscode.enable = true;
    programs.vscode.mutableExtensionsDir = false;
    programs.vscode.extensions = with pkgs.vscode-extensions; [
        # Nix language support
        bbenoist.nix 
        # IntelliSense (Pylance), Linting, ...
        # ms-python.python 
        # Open any folder or repository inside a Docker container
        ms-vscode-remote.remote-containers
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
        # Edit CSV
        {
            name = "vscode-edit-csv";
            publisher = "janisdd";
            version = "0.10.0";
            sha256 = "+sdlEpBpsy4l4wL1gi+ONCi5de9mX4eP85HC9dsuc5Q=";
        }
    ];
}