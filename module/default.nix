# The shared nixvim configuration, as a home-manager module.
#
# It closes over *this* flake's inputs, so consuming flakes need to know
# nothing about nixvim or the plugin sources:
#
#   modules = [ inputs.nvim.homeModules.nvim ];
#
# Requirements on the host config:
#   - stylix, for config.lib.stylix.colors (see homeModules.stylix-minimal)
#   - optional: nvim.configDirectory
inputs: { lib, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    (import ./plugins/markdown.nix inputs)
    (import ./plugins/utils.nix inputs)

    ./plugins/cmp.nix
    ./plugins/dashboard.nix
    ./plugins/git.nix
    ./plugins/lsp.nix
    ./plugins/tree.nix
    ./plugins/ui.nix
    ./plugins/dap.nix
    ./plugins/snacks.nix
    ./plugins/telescope.nix
    ./plugins/test.nix

    ./autocmds.nix
    ./options.nix
    ./keymaps.nix
  ];

  options.nvim.configDirectory = lib.mkOption {
    type = lib.types.str;
    default = "~/.config";
    description = "Repo the dashboard's config button opens.";
  };

  config.programs.nixvim = {
    enable = true;
    # We make nixvim follow our nixpkgs (see flake.nix); set the source
    # explicitly to suppress the mismatch warning this triggers.
    nixpkgs.source = inputs.nixpkgs;
    nixpkgs.config.allowUnfree = true;
  };
}
