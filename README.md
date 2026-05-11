# Neovim Keymaps

Leader: `Space`

Press `<leader>` and wait to see all groups via which-key, or `<leader>?` to fuzzy-search all keymaps.

## General

| Key | Action |
|---|---|
| `<leader>?` | Show all keymaps (Telescope) |
| `<leader>e` | Oil (float) |
| `-` | Oil (inline) |
| `<leader>E` | Neotree toggle |
| `s` | Flash jump |
| `K` | LSP hover |
| `<Esc>` (terminal) | Exit terminal mode |

## Navigation (tmux-navigator)

| Key | Action |
|---|---|
| `C-h` | Move left (nvim/tmux) |
| `C-j` | Move down (nvim/tmux) |
| `C-k` | Move up (nvim/tmux) |
| `C-l` | Move right (nvim/tmux) |

## Windows (`<leader>w`)

| Key | Action |
|---|---|
| `<leader>ws` | Horizontal split |
| `<leader>wv` | Vertical split |
| `<leader>wd` | Close window |

## Search (`<leader>s`)

| Key | Action |
|---|---|
| `<leader><Space>` | Find files |
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sb` | Buffers |
| `<leader>sh` | Help tags |
| `<leader>sc` | Commands |
| `<leader>sm` | Marks |
| `<leader>so` | Old files |
| `<leader>ss` | Spell suggest |
| `<leader>sr` | Clear search highlight |
| `<leader>st` | Todos |
| `<leader>sw` | Search current word (Spectre) |
| `<leader>sp` | Search in current file (Spectre) |
| `<leader>S` | Toggle Spectre |

## Code (`<leader>c`)

| Key | Action |
|---|---|
| `<leader>cd` | Go to definition |
| `<leader>cR` | References |
| `<leader>ct` | Type definition |
| `<leader>ca` | Code action |
| `<leader>cf` | Format |
| `<leader>cr` | Rename symbol |
| `<leader>cn` | Next diagnostic |
| `<leader>cp` | Previous diagnostic |
| `<leader>ce` | Show diagnostic float |

## Diagnostics / Trouble (`<leader>D`)

| Key | Action |
|---|---|
| `<leader>Dx` | Toggle diagnostics |
| `<leader>DX` | Buffer diagnostics |
| `<leader>Ds` | Symbols |
| `<leader>Dl` | LSP definitions/references |
| `<leader>DL` | Location list |
| `<leader>DQ` | Quickfix list |

## Testing (`<leader>t`)

| Key | Action |
|---|---|
| `<leader>tr` | Run nearest test |
| `<leader>tf` | Run tests in file |
| `<leader>ts` | Toggle test summary |
| `<leader>to` | Show test output |
| `<leader>td` | Debug nearest test |

## Debugging (`<leader>d`)

| Key | Action |
|---|---|
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dc` | Continue |
| `<leader>da` | Run with args |
| `<leader>dC` | Run to cursor |
| `<leader>dg` | Go to line (no execute) |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dO` | Step over |
| `<leader>dp` | Pause |
| `<leader>dt` | Terminate |
| `<leader>dr` | Toggle REPL |
| `<leader>ds` | Session |
| `<leader>du` | Toggle DAP UI |
| `<leader>dw` | Hover widgets |
| `<leader>de` | Eval (normal/visual) |
| `<leader>df` | Debug configurations |
| `<leader>dj` | Stack frame down |
| `<leader>dk` | Stack frame up |
| `<leader>dl` | Run last |

## AI (`<leader>a`)

| Key | Action |
|---|---|
| `<leader>ac` | Toggle Claude Code |
| `<leader>ar` | Resume Claude Code |

## UI (`<leader>u`)

| Key | Action |
|---|---|
| `<leader>uw` | Toggle word wrap |
| `<leader>ul` | Toggle linebreak |
| `<leader>us` | Toggle spellcheck |
| `<leader>uc` | Toggle cursorline |
| `<leader>un` | Toggle line numbers |
| `<leader>ur` | Toggle relative numbers |
| `<leader>ut` | Show tabline |
| `<leader>uT` | Hide tabline |

## Oil (inside Oil buffer)

Shared conventions with Telescope: `C-x` = horizontal split, `C-v` = vertical split.

| Key | Action |
|---|---|
| `<CR>` | Open file |
| `-` / `b` | Go to parent |
| `C-x` | Open in horizontal split |
| `C-v` | Open in vertical split |
| `C-t` | Open in new tab |
| `C-p` | Preview |
| `C-r` | Refresh |
| `C-c` | Close |
| `g.` | Toggle hidden files |
| `g?` | Show help |
| `gs` | Change sort |
| `gx` | Open external |
