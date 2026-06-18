# The render-markdown.nvim plugin is a plugin that renders markdown files in a neovim in a more readable way.
{ pkgs, config, inputs, ... }:
let
  accent = "#${config.lib.stylix.colors.base0D}";
  muted = "#${config.lib.stylix.colors.base03}";
  background = "#${config.lib.stylix.colors.base00}";
in {

  programs.nixvim = {
    plugins.mkdnflow = {
      enable = true;
      settings = {
        modules = { conceal = false; };

        to_do = {
          statuses = {
            not_started.marker = " ";
            in_progress.marker = "-";
            complete.marker = "x";
            important = {
              marker = "!";
              highlight = {
                marker.link = "WarningMsg";
                content.bold = true;
              };
            };
            cancelled.marker = "/";
          };
          status_order = [ "not_started" "in_progress" "complete" "important" "cancelled" ];
        };
        mappings = {
          MkdnCreateLink = false;
          MkdnCreateLinkFromClipboard = [ [ "n" "v" ] "<leader>ml" ];
          MkdnDecreaseHeading = [ [ "n" ] "<leader>m-" ];
          MkdnDestroyLink = false;
          MkdnEnter = [ [ "v" ] "<CR>" ];
          MkdnExtendList = false;
          MkdnFoldSection = [ [ "n" ] "<leader>mf" ];
          MkdnUnfoldSection = [ [ "n" ] "<leader>mF" ];
          MkdnFollowLink = [ [ "n" ] "gd" ];
          MkdnGoBack = false;
          MkdnGoForward = false;
          MkdnIncreaseHeading = [ [ "n" ] "<leader>m+" ];
          MkdnMoveSource = false;
          MkdnNewListItem = false;
          MkdnNewListItemAboveInsert = [ [ "n" ] "O" ];
          MkdnNewListItemBelowInsert = [ [ "n" ] "o" ];
          MkdnNextHeading = [ [ "n" ] "<leader>m#" ];
          MkdnTableAlignLeft = [ [ "n" ] "<leader>m<" ];
          MkdnTableAlignCenter = [ [ "n" ] "<leader>m=" ];
          MkdnTableAlignRight = [ [ "n" ] "<leader>m>" ];
          MkdnTableAlignDefault = [ [ "n" ] "<leader>m0" ];
          MkdnNextLink = [ [ "n" ] "<S-Tab>" ];
          MkdnPrevHeading = [ [ "n" ] "<leader>m*" ];
          MkdnPrevLink = false;
          MkdnSTab = false;
          MkdnTab = false;
          MkdnTableNewColAfter = [ [ "n" ] "<leader>mc" ];
          MkdnTableNewColBefore = [ [ "n" ] "<leader>mC" ];
          MkdnTableNewRowAbove = [ [ "n" ] "<leader>mR" ];
          MkdnTableNewRowBelow = [ [ "n" ] "<leader>mr" ];
          MkdnTableNextCell = [ [ "i" ] "<C-Tab>" ];
          MkdnTableNextRow = false;
          MkdnTablePrevCell = [ [ "i" ] "<S-Tab>" ];
          MkdnTablePrevRow = false;
          MkdnToggleToDo = [ [ "n" "v" ] "<C-Space>" ];
          MkdnUpdateNumbering = [ [ "n" ] "<leader>mn" ];
          MkdnYankAnchorLink = [ [ "n" ] "ya" ];
          MkdnYankFileAnchorLink = [ [ "n" ] "yfa" ];
        };
      };
    };
    extraFiles = {
      # TODO: Not working for some reasons
      "ftplugin/markdown.lua".text = ''
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
      '';
    };
    highlight = {
      RenderMarkdownBg.bg = background;
      RenderMarkdownH1.fg = accent;
      RenderMarkdownH2.fg = muted;
      RenderMarkdownH3.fg = muted;
      RenderMarkdownH4.fg = muted;
      RenderMarkdownH5.fg = muted;
      RenderMarkdownH6.fg = muted;
      RenderMarkdownTodo.fg = muted;
      RenderMarkdownWarning.fg = accent;
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "markdown.nvim";
        version = "0-unstable";
        src = inputs.plugin-markdown;
      })
    ];
    extraConfigLua =
      # lua
      ''
        require('render-markdown').setup({
          heading = {
            icons = { '# ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
            backgrounds = {
                'RenderMarkdownBg',
            },
            foregrounds = {
                'RenderMarkdownH1',
                'RenderMarkdownH2',
                'RenderMarkdownH3',
                'RenderMarkdownH4',
                'RenderMarkdownH5',
                'RenderMarkdownH6',
            },
          },
          checkbox = {
            unchecked = { highlight = 'RenderMarkdownTodo' },
            checked = { highlight = 'RenderMarkdownTodo' },
            custom = {
              pending = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
              important = { raw = '[!]', rendered = ' ', highlight = 'RenderMarkdownWarning' },
              cancel = { raw = '[/]', rendered = '󱋬 ', highlight = 'RenderMarkdownTodo' },
            },
          },
        })
      '';
  };
}
