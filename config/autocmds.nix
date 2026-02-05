{
  autoCmd = [
    # Disable mini.pairs in markdown
    {
      event = [ "FileType" ];
      pattern = [ "markdown" ];
      callback.__raw = ''
        function()
          vim.b.minipairs_disable = true
        end
      '';
    }

    # Set conceallevel to 0 for markdown
    {
      event = [ "FileType" ];
      pattern = [ "markdown" ];
      callback.__raw = ''
        function()
          vim.opt_local.conceallevel = 0
        end
      '';
    }

    # Highlight on yank
    {
      event = [ "TextYankPost" ];
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }

    # Resize splits on window resize
    {
      event = [ "VimResized" ];
      callback.__raw = ''
        function()
          local current_tab = vim.fn.tabpagenr()
          vim.cmd("tabdo wincmd =")
          vim.cmd("tabnext " .. current_tab)
        end
      '';
    }

    # Go to last position when opening a buffer
    {
      event = [ "BufReadPost" ];
      callback.__raw = ''
        function(event)
          local exclude = { "gitcommit" }
          local buf = event.buf
          if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
          end
          vim.b[buf].lazyvim_last_loc = true
          local mark = vim.api.nvim_buf_get_mark(buf, '"')
          local lcount = vim.api.nvim_buf_line_count(buf)
          if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
          end
        end
      '';
    }

    # Close some filetypes with q
    {
      event = [ "FileType" ];
      pattern = [ "help" "lspinfo" "notify" "qf" "checkhealth" ];
      callback.__raw = ''
        function(event)
          vim.bo[event.buf].buflisted = false
          vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
        end
      '';
    }
  ];
}
