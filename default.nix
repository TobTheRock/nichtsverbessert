{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins/cmp.nix
    ./plugins/dashboard.nix
    ./plugins/git.nix
    ./plugins/lsp.nix
    ./plugins/markdown.nix
    ./plugins/tree.nix
    ./plugins/ui.nix
    ./plugins/utils.nix
    ./plugins/dap.nix
    ./plugins/snacks.nix
    ./plugins/telescope.nix
    ./plugins/test.nix

    ./autocmds.nix
    ./options.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    # We make nixvim follow our nixpkgs (see flake.nix); set the source
    # explicitly to suppress the mismatch warning this triggers.
    nixpkgs.source = inputs.nixpkgs;
    nixpkgs.config.allowUnfree = true;
  };
}
