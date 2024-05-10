{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs: {
        nixosConfigurations = {
            lenovo-p14s = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {inherit inputs;};
                modules = [
                    ./hosts/lenovo-p14s
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = inputs;
                        home-manager.users.alexandrec = import ./home;
                    }
                ];
            };
        };
    };
}