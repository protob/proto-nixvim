{
  plugins.bufferline = {
    enable = true;
    settings = {
      options = {
        diagnostics = "nvim_lsp";
        mode = "buffers";
        close_icon = " ";
        buffer_close_icon = "󰱝 ";
        modified_icon = "󰔯 ";
        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
        ];
      };
    };
  };

  keymaps = [
    { mode = "n"; key = "]b"; action = "<cmd>BufferLineCycleNext<cr>"; options.desc = "Next Buffer"; }
    { mode = "n"; key = "[b"; action = "<cmd>BufferLineCyclePrev<cr>"; options.desc = "Prev Buffer"; }
    { mode = "n"; key = "<S-l>"; action = "<cmd>BufferLineCycleNext<cr>"; options.desc = "Next Buffer"; }
    { mode = "n"; key = "<S-h>"; action = "<cmd>BufferLineCyclePrev<cr>"; options.desc = "Prev Buffer"; }
    { mode = "n"; key = "<leader>bd"; action = "<cmd>bdelete<cr>"; options.desc = "Delete Buffer"; }
    { mode = "n"; key = "<leader>bl"; action = "<cmd>BufferLineCloseLeft<cr>"; options.desc = "Close Buffers Left"; }
    { mode = "n"; key = "<leader>bo"; action = "<cmd>BufferLineCloseOthers<cr>"; options.desc = "Close Other Buffers"; }
    { mode = "n"; key = "<leader>bp"; action = "<cmd>BufferLineTogglePin<cr>"; options.desc = "Toggle Pin"; }
    { mode = "n"; key = "<leader>bP"; action = "<cmd>BufferLineGroupClose ungrouped<cr>"; options.desc = "Close Non-pinned Buffers"; }
  ];
}
