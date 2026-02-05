{
  plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add = { text = " "; };
        change = { text = " "; };
        delete = { text = " "; };
        untracked = { text = ""; };
        topdelete = { text = "󱂥 "; };
        changedelete = { text = "󱂧 "; };
      };
      attach_to_untracked = false;
      current_line_blame = false;
      preview_config = {
        border = "single";
        style = "minimal";
        relative = "cursor";
        row = 0;
        col = 1;
      };
    };
  };

  keymaps = [
    { mode = "n"; key = "]h"; action = "<cmd>Gitsigns next_hunk<cr>"; options.desc = "Next Hunk"; }
    { mode = "n"; key = "[h"; action = "<cmd>Gitsigns prev_hunk<cr>"; options.desc = "Prev Hunk"; }
    { mode = "n"; key = "<leader>ghs"; action = "<cmd>Gitsigns stage_hunk<cr>"; options.desc = "Stage Hunk"; }
    { mode = "n"; key = "<leader>ghr"; action = "<cmd>Gitsigns reset_hunk<cr>"; options.desc = "Reset Hunk"; }
    { mode = "n"; key = "<leader>ghS"; action = "<cmd>Gitsigns stage_buffer<cr>"; options.desc = "Stage Buffer"; }
    { mode = "n"; key = "<leader>ghu"; action = "<cmd>Gitsigns undo_stage_hunk<cr>"; options.desc = "Undo Stage Hunk"; }
    { mode = "n"; key = "<leader>ghR"; action = "<cmd>Gitsigns reset_buffer<cr>"; options.desc = "Reset Buffer"; }
    { mode = "n"; key = "<leader>ghp"; action = "<cmd>Gitsigns preview_hunk<cr>"; options.desc = "Preview Hunk"; }
    { mode = "n"; key = "<leader>ghb"; action = "<cmd>Gitsigns blame_line<cr>"; options.desc = "Blame Line"; }
    { mode = "n"; key = "<leader>ghd"; action = "<cmd>Gitsigns diffthis<cr>"; options.desc = "Diff This"; }
  ];
}
