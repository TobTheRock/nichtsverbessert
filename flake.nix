{
  description = "Shared nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";

    plugin-markdown = {
      url = "github:MeanderingProgrammer/render-markdown.nvim";
      flake = false;
    };
    plugin-agentic = {
      url = "github:carlos-algms/agentic.nvim";
      flake = false;
    };
  };

  outputs = inputs: {
    homeModules = {
      nvim = import ./module inputs;
      stylix-minimal = import ./stylix-minimal.nix inputs;
    };

    # The palette, so consumers can theme the rest of their system to match.
    lib.base16 = import ./palette.nix;
  };
}
