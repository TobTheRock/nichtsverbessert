{ config, pkgs, inputs, ... }: {
  programs.nixvim = {
    highlightOverride = {
      FloatBorder.fg = "#${config.lib.stylix.colors.base0D}";
    };
    plugins = {
      # copilot-vim = {
      #   enable = true;
      #   package = pkgs.vimPlugins.copilot-vim;
      # };
      # codecompanion = {
      #   enable = true;
      # };
      # copilot-lua = {
      #   enable = true;
      #   autoLoad = true;
      # };
      # copilot-chat.enable = true;
      flash.enable = true;
      image = {
        enable = true;
        settings.integrations.markdown = {
          clearInInsertMode = true;
          onlyRenderImageAtCursor = true;
        };
      };
      tmux-navigator.enable = true;
      comment.enable = true;
      nvim-autopairs.enable = true;
      friendly-snippets.enable = true;
      todo-comments.enable = true;
      treesitter = {
        enable = true;
        nixGrammars = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
        };
      };
      treesitter-context.enable = true;
      toggleterm = {
        enable = true;
        settings = {
          size = 80;
          open_mapping = "[[<leader>`]]";
          direction = "vertical";
        };
      };
      yanky.enable = true;
      spectre.enable = true;
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "agentic.nvim";
        version = "0-unstable";
        src = inputs.plugin-agentic;
        doCheck = false;
      })
    ];
    extraConfigLua =
      # lua
      ''
        require("agentic").setup({
          provider = "claude-agent-acp",
        })
      '';
  };
}
