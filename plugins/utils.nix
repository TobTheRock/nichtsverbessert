{ config, pkgs, ... }: {
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
      #   settings = {
      #     strategies = {
      #       chat = {
      #         adapter = "anthropic";
      #       };
      #       inline = {
      #         adapter = "anthropic";
      #       };
      #     };
      #     adapters = {
      #       anthropic = {
      #         name = "anthropic";
      #         roles = {
      #           llm = "claude-3-5-sonnet-20241022";
      #           inline = "claude-3-5-haiku-20241022";
      #         };
      #       };
      #     };
      #   };
      # };
      claude-code = {
        enable = true;
        settings = {
          terminal = {
            position = "right";
            size = 80;
          };
          auto_reload = true;
          debug = false;
          keymaps = {
            toggle = {
              normal = "<leader>ac";
              terminal = "<C-,>";
              variants = {
                continue = "<leader>aC";
                verbose = "<leader>aV";
              };
            };
            window_navigation = true;
            scrolling = true;
          };
        };
      };
      copilot-lua = {
        enable = true;
        autoLoad = true;
      };
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
  };
}
