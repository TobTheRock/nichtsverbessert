{ pkgs, ... }:
let
  # mmdc renders mermaid code blocks for snacks.image. It drives a headless
  # Chrome, which nixpkgs' mermaid-cli doesn't bundle on darwin.
  mmdc = pkgs.writeShellScriptBin "mmdc" ''
    export PUPPETEER_EXECUTABLE_PATH="${pkgs.google-chrome}/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
    exec ${pkgs.mermaid-cli}/bin/mmdc "$@"
  '';
in {
  programs.nixvim = {
    # snacks.image runs `magick identify` on every rendered image, mmdc output included.
    extraPackages = [ mmdc pkgs.imagemagick ];

    # snacks.image normally starts on the first file read; scratch buffers
    # like the agentic chat never trigger one, so start it at launch.
    extraConfigLuaPost = "Snacks.image.setup()";

    plugins.snacks = {
      enable = true;
      settings = {
        image.enable = true;
        quickfile.enable = true;
        statuscolumn.enable = true;
        zen.enable = true;
        bufdelete.enable = true;
      };
    };

    keymaps = [
      {
        key = "<leader>uz";
        action = "<cmd>lua Snacks.zen()<cr>";
        options.desc = "Zen";
      }
      {
        key = "<leader>ud";
        action = "<cmd>lua Snacks.dim.enable()<cr>";
        options.desc = "Dim";
      }
      {
        key = "<leader>uD";
        action = "<cmd>lua Snacks.dim.disable()<cr>";
        options.desc = "Undim";
      }
      {
        key = "<leader>wc";
        action = "<cmd>lua Snacks.bufdelete.all()<cr>";
        options.desc = "Close all buffers";
      }
    ];
  };
}
