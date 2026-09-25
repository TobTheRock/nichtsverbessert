# Just enough stylix for this config's colors: the palette and a mono font,
# no desktop/GUI targets. Self-contained — brings stylix's home-manager
# module along, so consumers need no stylix input of their own.
inputs: { pkgs, ... }: {
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    enableReleaseChecks = false;
    polarity = "dark";
    base16Scheme = import ./palette.nix;
    fonts.monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrains Mono Nerd Font";
    };
  };
}
