{
  plugins.toggleterm = {
    enable = true;
    settings = {
      size = ''
        function(term)
          if term.direction == "horizontal" then
            return 15
          end
        end
      '';
      open_mapping = null;
      direction = "horizontal";
      shade_terminals = false;
      persist_size = true;
      close_on_exit = true;
      auto_scroll = true;
    };
  };

  # Preserve your exact terminal keybindings
  keymaps = [
    # Numbered terminals
    {
      mode = "n";
      key = "<leader>t1";
      action = "<cmd>1ToggleTerm size=15 direction=horizontal<cr>";
      options.desc = "Terminal 1 (Bottom)";
    }
    {
      mode = "n";
      key = "<leader>t2";
      action = "<cmd>2ToggleTerm size=15 direction=horizontal<cr>";
      options.desc = "Terminal 2 (Bottom)";
    }
    {
      mode = "n";
      key = "<leader>t3";
      action = "<cmd>3ToggleTerm size=15 direction=horizontal<cr>";
      options.desc = "Terminal 3 (Bottom)";
    }
    # Quick toggle
    {
      mode = "n";
      key = "<leader>1";
      action = "<cmd>1ToggleTerm<cr>";
      options.desc = "Terminal 1";
    }
    {
      mode = "n";
      key = "<leader>2";
      action = "<cmd>2ToggleTerm<cr>";
      options.desc = "Terminal 2";
    }
    {
      mode = "n";
      key = "<leader>3";
      action = "<cmd>3ToggleTerm<cr>";
      options.desc = "Terminal 3";
    }
    # Ctrl+/ for terminal 1
    {
      mode = [ "n" "t" ];
      key = "<C-/>";
      action = "<cmd>1ToggleTerm<cr>";
      options = {
        desc = "Toggle Terminal 1";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = [ "n" "t" ];
      key = "<C-_>";
      action = "<cmd>1ToggleTerm<cr>";
      options = {
        desc = "Toggle Terminal 1";
        silent = true;
        noremap = true;
      };
    }
  ];

  # Open/close all terminals helper functions
  extraConfigLua = ''
    function OpenAllTerminals()
      for i = 1, 3 do
        vim.cmd(i .. 'ToggleTerm size=15 direction=horizontal')
      end
    end

    function CloseAllTerminals()
      vim.cmd('ToggleTermToggleAll')
    end

    vim.keymap.set('n', '<leader>ta', '<cmd>lua OpenAllTerminals()<cr>', { desc = 'Open All 3 Terminals' })
    vim.keymap.set('n', '<leader>tc', '<cmd>lua CloseAllTerminals()<cr>', { desc = 'Close All Terminals' })
  '';
}
