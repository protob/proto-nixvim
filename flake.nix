{
  description = "Proto-NixVim — deterministic Neovim, LazyVim-style UX";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      config = import ./config;

      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };
    in
    {
      packages.${system}.default = nvim;

      checks.${system}.default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
        inherit nvim;
        name = "proto-nixvim";
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        shellHook = ''
          echo "Proto-NixVim dev shell ready"
          PS1="proto-nixvim: \w \$ "
          alias vim='nvim'
        '';
        packages = [ nvim ];
      };
    };
}
