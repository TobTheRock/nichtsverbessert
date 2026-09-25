{ pkgs, ... }: {
  programs.nixvim.plugins.neotest = {
    enable = true;
    package = pkgs.vimPlugins.neotest;
    # TODO  needs nextest, maybe use rustaceanvim
    adapters = { rust.enable = true; };
  };
}
