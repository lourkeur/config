{
  description = "A highly structured configuration database.";

  inputs =
    {
      override.url = "nixpkgs";
      nixos.url = "nixpkgs/release-20.09";
      home.url = "github:nix-community/home-manager/release-20.09";
      home.inputs.nixpkgs.follows = "nixos";
      impermanence.url = "github:nix-community/impermanence";
      utils.url = "github:numtide/flake-utils/flatten-tree-system";
      devshell.url = "github:numtide/devshell";
      nixos-hardware.url = "github:nixos/nixos-hardware";
      flake-compat.url = "github:edolstra/flake-compat";
      flake-compat.flake = false;
    };

  outputs =
    inputs@{ devshell
    , home
    , nixos
    , nixos-hardware
    , nur
    , override
    , self
    , utils
    , ...
    }:
    let
      inherit (utils.lib) eachDefaultSystem flattenTreeSystem;
      inherit (nixos.lib) recursiveUpdate;
      inherit (self.lib) overlays nixosModules genPackages genPkgs
        genHomeActivationPackages mkNodes;

      extern = import ./extern { inherit inputs; };

      pkgs' = genPkgs { inherit self; };

      outputs =
        let
          system = "x86_64-linux";
          pkgs = pkgs'.${system};
        in
        {
          inherit nixosModules overlays;

          nixosConfigurations =
            import ./hosts (recursiveUpdate inputs {
              inherit pkgs system extern;
              inherit (pkgs) lib;
            });

          overlay = import ./pkgs;

          lib = import ./lib { inherit nixos; };

          templates.flk.path = ./.;

          templates.flk.description = "flk template";

          defaultTemplate = self.templates.flk;
        };

      systemOutputs = eachDefaultSystem (system:
        let pkgs = pkgs'.${system}; in
        {
          packages = flattenTreeSystem system
            (genPackages {
              inherit self pkgs;
            });

          devShell = import ./shell {
            inherit self system;
          };

          legacyPackages.hmActivationPackages =
            genHomeActivationPackages { inherit self; };
        }
      );
    in
    recursiveUpdate outputs systemOutputs;
}
