{
  description = "DevShell for Create Adventured Modpack";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    packwiz = {
      url = "github:evictedcucumber/packwiz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    packwiz,
    ...
  }:
    flake-utils.lib.eachSystem flake-utils.lib.allSystems (system: let
      pkgs = import nixpkgs {
        inherit system;

        config.allowUnfree = true;
      };
      packwiz-pkg = packwiz.packages.${system}.default;
    in {
      devShells.default = pkgs.mkShell {
        name = "create-adventured";
        packages = [
          packwiz-pkg
        ];
      };
    });
}
