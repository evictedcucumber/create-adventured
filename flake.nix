{
  description = "DevShell for Create Adventured Modpack";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
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
          pkgs.lefthook
          (pkgs.writeShellScriptBin "ca-add" ''
            ''$PACKWIZ_BIN mr add "$@"
          '')
          (pkgs.writeShellScriptBin "ca-refresh" ''
            ''$PACKWIZ_BIN refresh
          '')
          (pkgs.writeShellScriptBin "ca-export" ''
            ''$PACKWIZ_BIN mr export
          '')
          (pkgs.writeShellScriptBin "ca-validate" ''
            ''$PACKWIZ_BIN validate
          '')
          (pkgs.writeShellScriptBin "ca-fix" ''
            ''$PACKWIZ_BIN fix
          '')
          (pkgs.writeShellScriptBin "ca-update-all" ''
            ''$PACKWIZ_BIN update --all
          '')
          (pkgs.writeShellScriptBin "ca-modlist" ''
            ''$PACKWIZ_BIN modlist generate
          '')
          (pkgs.writeShellScriptBin "ca-deps" ''
            ''$PACKWIZ_BIN dependencies fix
          '')
        ];

        PACKWIZ_BIN = "${packwiz-pkg}/bin/packwiz";
        # PACKWIZ_BIN = "../packwiz/packwiz";
      };
    });
}
