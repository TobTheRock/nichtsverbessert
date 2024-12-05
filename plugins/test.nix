{ ... }: {
  programs.nixvim.plugins.neotest = {
    enable = true;
    # TODO  needs nextest, maybe use rustaceanvim
    adapters = { rust.enable = true; };
  };
}
