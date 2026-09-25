# nichtsverbessert

A Neovim distribution built declaratively with
[nixvim](https://github.com/nix-community/nixvim). No `lazy.nvim`, no
hand-edited `~/.config/nvim` — plugins, LSP servers, formatters and debuggers
all come from the Nix store, pinned by a flake lock. Same editor on NixOS and
macOS.

Ships home-manager modules, not a program. Use it as a flake input.

## Usage

```nix
{
  inputs = {
    # nixpkgs must be a direct input: home-manager reads `pkgs.path`,
    # which does not resolve through a `follows` on a transitive input.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nichtsverbessert = {
      url = "github:TobTheRock/nichtsverbessert";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

Then in a home-manager configuration:

```nix
modules = [
  inputs.nichtsverbessert.homeModules.nvim
  inputs.nichtsverbessert.homeModules.stylix-minimal
  { nvim.configDirectory = "/path/to/your/nix-config"; }
];
```

| Output | Contents |
|---|---|
| `homeModules.nvim` | the config; requires stylix in the host config |
| `homeModules.stylix-minimal` | palette + mono font, no desktop targets |
| `lib.base16` | the palette as an attrset, to theme the rest of the system |

One option: `nvim.configDirectory` — the repo the dashboard button opens. Drop
`stylix-minimal` if the host already has stylix.

Update:

```sh
nix flake update nichtsverbessert
```

## Features

**LSP & languages** — nixd, gopls, clangd, ts_ls, bashls, html, tailwindcss,
marksman, plus [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) for Rust.
Format on save via `lsp-format` and `none-ls` (nixfmt, goimports, shfmt,
shellharden, markdownlint, tidy). Inlay hints on.

**Completion** — `nvim-cmp` with LSP, buffer, path, snippet and emoji sources,
LuaSnip with friendly-snippets, Copilot as an additional source.

**Navigation** — Telescope (files, live grep, oldfiles, keymaps),
[snacks.nvim](https://github.com/folke/snacks.nvim), neo-tree and oil as file
browsers, flash for in-buffer jumps, tmux-navigator for window/pane switching.

**Git** — gitsigns in the sign column, stage and reset hunks in the buffer.

**Debugging & tests** — nvim-dap with dap-ui, virtual text and dap-go, neotest
as test runner.

**Markdown** — mkdnflow for links and checkboxes, render-markdown.nvim for
inline rendering in theme colors.

**AI** — [agentic.nvim](https://github.com/carlos-algms/agentic.nvim) and
copilot-chat.

**UI** — alpha dashboard, lualine, noice, trouble, indent-blankline,
treesitter-context, todo-comments, colorizer, dressing, spectre for
project-wide search/replace, yanky for yank history. All colors come from
stylix, so the theme matches the rest of the system.

All keybindings: [KEYBINDINGS.md](KEYBINDINGS.md). Leader is `Space`,
`<leader>?` searches them via Telescope.
