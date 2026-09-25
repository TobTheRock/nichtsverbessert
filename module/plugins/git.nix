{
  programs.nixvim = {
    plugins = {
      gitsigns.enable = true;
      snacks.settings = { lazygit.enable = true; };
    };
    keymaps = [
      {
        key = "<leader>gl";
        action = "<cmd>lua Snacks.lazygit()<cr>";
        options.desc = "LazyGit";
      }
      {
        key = "<leader>gd";
        action = "<cmd>Gitsigns diffthis<cr>";
        options.desc = "Diff file";
      }
      {
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk<cr>";
        options.desc = "Preview hunk";
      }
      {
        key = "<leader>gr";
        action = "<cmd>Gitsigns reset_hunk<cr>";
        options.desc = "Reset hunk";
      }
    ];
  };
}
