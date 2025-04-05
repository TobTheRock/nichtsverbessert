{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      settings = {
        delay = 600;
        icons = {
          breadcrumb = "»";
          group = "+";
          separator = ""; # ➜
          mappings = false;
        };
        spec = [
          # General Mappings
          {
            __unkeyed-1 = "<leader>c";
            mode = [ "n" "v" ];
            group = "+code";
          }
          {
            __unkeyed-1 = "<leader>d";
            mode = [ "n" "v" ];
            group = "+debug";
          }
          {
            __unkeyed-1 = "<leader>s";
            mode = "n";
            group = "+search";
          }
          {
            __unkeyed-1 = "<leader>m";
            mode = "n";
            group = "+markdown";
          }
          {
            __unkeyed-1 = "<leader>D";
            mode = "n";
            group = "+trouble";
          }
          {
            __unkeyed-1 = "<leader>u";
            mode = "n";
            group = "+ui";
          }
          {
            __unkeyed-1 = "<leader>w";
            mode = "n";
            group = "+windows";
          }
          {
            __unkeyed-1 = "<leader>h";
            mode = "n";
            group = "+harpoon";
          }
          {
            __unkeyed-1 = "<leader>t";
            mode = "n";
            group = "+neotest";
          }
          {
            __unkeyed-1 = "<leader>d";
            mode = "n";
            group = "debugging";
          }
        ];
        win = {
          border = "rounded";
          wo.winblend = 0;
        };
      };
    };

    keymaps = [
      # General Mappings
      {
        key = "<leader>e";
        action = "<cmd>Oil --float<cr>";
        options.desc = "Oil";
      }
      {
        key = "-";
        action = "<cmd>Oil<cr>";
        options.desc = "Oil";
      }
      {
        key = "<leader>E";
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "Neotree";
      }

      {
        key = "s";
        action = "<cmd>lua require('flash').jump()<cr>";
        options.desc = "Flash";
      }
      {
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<cr>";
        options.desc = "LSP Hover";
      }

      {
        key = "<C-h>";
        action = "<cmd>TmuxNavigateLeft<cr>";
      }
      {
        key = "<C-j>";
        action = "<cmd>TmuxNavigateDown<cr>";
      }
      {
        key = "<C-k>";
        action = "<cmd>TmuxNavigateUp<cr>";
      }
      {
        key = "<C-l>";
        action = "<cmd>TmuxNavigateRight<cr>";
      }

      # UI
      {
        key = "<leader>uw";
        action = "<cmd>set wrap!<cr>";
        options.desc = "Toggle word wrapping";
      }
      {
        key = "<leader>ul";
        action = "<cmd>set linebreak!<cr>";
        options.desc = "Toggle linebreak";
      }
      {
        key = "<leader>us";
        action = "<cmd>set spell!<cr>";
        options.desc = "Toggle spellcheck";
      }
      {
        key = "<leader>uc";
        action = "<cmd>set cursorline!<cr>";
        options.desc = "Toggle cursorline";
      }
      {
        key = "<leader>un";
        action = "<cmd>set number!<cr>";
        options.desc = "Toggle line numbers";
      }
      {
        key = "<leader>ur";
        action = "<cmd>set relativenumber!<cr>";
        options.desc = "Toggle relative line numbers";
      }
      {
        key = "<leader>ut";
        action = "<cmd>set showtabline=2<cr>";
        options.desc = "Show tabline";
      }
      {
        key = "<leader>uT";
        action = "<cmd>set showtabline=0<cr>";
        options.desc = "Hide tabline";
      }

      # Search
      {
        key = "<leader> ";
        action = "<cmd>lua require('telescope.builtin').find_files()<cr>";
        options.desc = "Telescope";
      }
      {
        key = "<leader>sg";
        action = "<cmd>lua require('telescope.builtin').live_grep()<cr>";
        options.desc = "Livegrep";
      }
      {
        key = "<leader>sf";
        action = "<cmd>lua require('telescope.builtin').find_files()<cr>";
        options.desc = "Find Files";
      }
      {
        key = "<leader>sb";
        action = "<cmd>lua require('telescope.builtin').buffers()<cr>";
        options.desc = "Buffers";
      }
      {
        key = "<leader>sh";
        action = "<cmd>lua require('telescope.builtin').help_tags()<cr>";
        options.desc = "Help Tags";
      }
      {
        key = "<leader>sc";
        action = "<cmd>lua require('telescope.builtin').commands()<cr>";
        options.desc = "Commands";
      }
      {
        key = "<leader>sm";
        action = "<cmd>lua require('telescope.builtin').marks()<cr>";
        options.desc = "Marks";
      }
      {
        key = "<leader>so";
        action = "<cmd>lua require('telescope.builtin').oldfiles()<cr>";
        options.desc = "Oldfiles";
      }
      {
        key = "<leader>ss";
        action = "<cmd>lua require('telescope.builtin').spell_suggest()<cr>";
        options.desc = "Spell Suggest";
      }
      {
        key = "<leader>sr";
        action = "<cmd>:noh<return><esc>";
        options.desc = "Reset search";
      }
      {
        key = "<leader>st";
        action = "<cmd>TodoTelescope<cr>";
        options.desc = "Todos";
      }
      {
        key = "<leader>S";
        action = "<cmd>lua require('spectre').toggle()<cr>";
        options.desc = "Toggle Spectre";
      }
      {
        key = "<leader>sw";
        action =
          "<cmd>lua require('spectre').open_visual({select_word=true})<cr>";
        options.desc = "Search current word";
      }
      {
        key = "<leader>sp";
        action =
          "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>";
        options.desc = "Search on current file";
      }

      # Trouble
      {
        key = "<leader>Dx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options.desc = "Diagnostics (Trouble)";
      }
      {
        key = "<leader>DX";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        options.desc = "Buffer Diagnostics (Trouble)";
      }
      {
        key = "<leader>Ds";
        action = "<cmd>Trouble symbols toggle focus=false<cr>";
        options.desc = "Symbols (Trouble)";
      }
      {
        key = "<leader>Dl";
        action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
        options.desc = "LSP Definitions / references / ... (Trouble)";
      }
      {
        key = "<leader>DL";
        action = "<cmd>Trouble loclist toggle<cr>";
        options.desc = "Location List (Trouble)";
      }
      {
        key = "<leader>DQ";
        action = "<cmd>Trouble qflist toggle<cr>";
        options.desc = "Quickfix List (Trouble)";
      }

      # Windows
      {
        key = "<leader>ws";
        action = "<cmd>split<cr>";
        options.desc = "Split";
      }
      {
        key = "<leader>wv";
        action = "<cmd>vsplit<cr>";
        options.desc = "VSplit";
      }
      {
        key = "<leader>wd";
        action = "<cmd>close<cr>";
        options.desc = "Close";
      }

      # Code
      {
        key = "<leader>cd";
        action = "<cmd>lua vim.lsp.buf.definition()<cr>";
        options.desc = "LSP Definition";
      }
      {
        key = "<leader>cr";
        action = "<cmd>lua vim.lsp.buf.references()<cr>";
        options.desc = "LSP References";
      }
      {
        key = "<leader>ct";
        action = "<cmd>lua vim.lsp.buf.type_definition()<cr>";
        options.desc = "LSP Type Definition";
      }
      {
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
        options.desc = "LSP Code Action";
      }
      {
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.formatting()<cr>";
        options.desc = "LSP Formatting";
      }
      {
        key = "<leader>cn";
        action = "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>";
        options.desc = "LSP Next Diagnostic";
      }
      {
        key = "<leader>cp";
        action = "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>";
        options.desc = "LSP Previous Diagnostic";
      }
      # rename symbol
      {
        key = "<leader>cR";
        action = "<cmd>lua vim.lsp.buf.rename()<cr>";
        options.desc = "LSP Rename Symbol";
      }
      # Copilot chat
      {
        key = "<leader>cc";
        action = "<cmd>lua require('CopilotChat').open()<cr>";
        options.desc = "Copilot Chat";
      }

      # Neotest
      {
        key = "<leader>tt";
        action = "<cmd>lua require('neotest').run.run()<cr>";
        options.desc = "Run nearest test";
      }
      {
        key = "<leader>tf";
        action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>";
        options.desc = "Run tests in file";
      }
      {
        key = "<leader>ts";
        action = "<cmd>lua require('neotest').summary.toggle()<cr>";
        options.desc = "Toggle test summary";
      }
      {
        key = "<leader>to";
        action =
          "<cmd>lua require('neotest').output.open({ enter = true })<cr>";
        options.desc = "Show test output";
      }
      {
        key = "<leader>td";
        action =
          ''<cmd>lua require('neotest').run.run({strategy = "dap"})<cr>'';
        options.desc = "Debug nearest test";
      }

      # Debugging
      {
        mode = "n";
        key = "<leader>dB";
        action =
          "\n        <cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>\n      ";
        options = {
          silent = true;
          desc = "Breakpoint Condition";
        };
      }
      {
        mode = "n";
        key = "<leader>db";
        action = ":DapToggleBreakpoint<cr>";
        options = {
          silent = true;
          desc = "Toggle Breakpoint";
        };
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = ":DapContinue<cr>";
        options = {
          silent = true;
          desc = "Continue";
        };
      }
      {
        mode = "n";
        key = "<leader>da";
        action = "<cmd>lua require('dap').continue({ before = get_args })<cr>";
        options = {
          silent = true;
          desc = "Run with Args";
        };
      }
      {
        mode = "n";
        key = "<leader>dC";
        action = "<cmd>lua require('dap').run_to_cursor()<cr>";
        options = {
          silent = true;
          desc = "Run to cursor";
        };
      }
      {
        mode = "n";
        key = "<leader>dg";
        action = "<cmd>lua require('dap').goto_()<cr>";
        options = {
          silent = true;
          desc = "Go to line (no execute)";
        };
      }
      {
        mode = "n";
        key = "<leader>di";
        action = ":DapStepInto<cr>";
        options = {
          silent = true;
          desc = "Step into";
        };
      }
      {
        mode = "n";
        key = "<leader>dj";
        action = "\n        <cmd>lua require('dap').down()<cr>\n      ";
        options = {
          silent = true;
          desc = "Down";
        };
      }
      {
        mode = "n";
        key = "<leader>dk";
        action = "<cmd>lua require('dap').up()<cr>";
        options = {
          silent = true;
          desc = "Up";
        };
      }
      {
        mode = "n";
        key = "<leader>dl";
        action = "<cmd>lua require('dap').run_last()<cr>";
        options = {
          silent = true;
          desc = "Run Last";
        };
      }
      {
        mode = "n";
        key = "<leader>do";
        action = ":DapStepOut<cr>";
        options = {
          silent = true;
          desc = "Step Out";
        };
      }
      {
        mode = "n";
        key = "<leader>dO";
        action = ":DapStepOver<cr>";
        options = {
          silent = true;
          desc = "Step Over";
        };
      }
      {
        mode = "n";
        key = "<leader>dp";
        action = "<cmd>lua require('dap').pause()<cr>";
        options = {
          silent = true;
          desc = "Pause";
        };
      }
      {
        mode = "n";
        key = "<leader>dr";
        action = ":DapToggleRepl<cr>";
        options = {
          silent = true;
          desc = "Toggle REPL";
        };
      }
      {
        mode = "n";
        key = "<leader>ds";
        action = "<cmd>lua require('dap').session()<cr>";
        options = {
          silent = true;
          desc = "Session";
        };
      }
      {
        mode = "n";
        key = "<leader>dt";
        action = ":DapTerminate<cr>";
        options = {
          silent = true;
          desc = "Terminate";
        };
      }
      {
        mode = "n";
        key = "<leader>du";
        action = "<cmd>lua require('dapui').toggle()<cr>";
        options = {
          silent = true;
          desc = "Dap UI";
        };
      }
      {
        mode = "n";
        key = "<leader>dw";
        action = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
        options = {
          silent = true;
          desc = "Widgets";
        };
      }
      {
        mode = [ "n" "v" ];
        key = "<leader>de";
        action = "<cmd>lua require('dapui').eval()<cr>";
        options = {
          silent = true;
          desc = "Eval";
        };
      }
      {
        mode = "n";
        key = "<leader>df";
        action =
          "<CMD>lua require('dap.ext.vscode').load_launchjs()<CR><CMD>Telescope dap configurations<CR>";
        options = { desc = "Debug Configurations"; };
      }

      # Terminal Mappings
      # {
      #   key = "<leader>`";
      #   action = "<cmd>lua require('ToggleTerm')<cr>";
      #   options.desc = "Toggle Terminal";
      # }
      {
        key = "<Esc>";
        mode = "t";
        action = "<C-\\><C-N>";
      }
      {
        key = "<C-h>";
        mode = "t";
        action = "<C-\\><C-N><C-w>h";
      }
      {
        key = "<C-j>";
        mode = "t";
        action = "<C-\\><C-N><C-w>j";
      }
      {
        key = "<C-k>";
        mode = "t";
        action = "<C-\\><C-N><C-w>k";
      }
      {
        key = "<C-l>";
        mode = "t";
        action = "<C-\\><C-N><C-w>l";
      }
    ];
  };
}
