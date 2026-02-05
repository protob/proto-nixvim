{
  plugins.neo-tree = {
    enable = true;
    settings = {
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];
      add_blank_line_at_top = false;

      filesystem = {
        bind_to_cwd = false;
        follow_current_file = {
          enabled = true;
        };
      };

      default_component_configs = {
        indent = {
          with_expanders = true;
          expander_collapsed = "󰅂";
          expander_expanded = "󰅀";
          expander_highlight = "NeoTreeExpander";
        };
        git_status = {
          symbols = {
            added = " ";
            conflict = "󰩌 ";
            deleted = "󱂥";
            ignored = " ";
            modified = " ";
            renamed = "󰑕";
            staged = "󰩍";
            unstaged = "";
            untracked = " ";
          };
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options.desc = "Toggle Neo-tree";
    }
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>Neotree reveal<cr>";
      options.desc = "Reveal in Neo-tree";
    }
  ];

  # Neo-tree Y keybind for copying file paths (from your LazyVim config)
  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree",
      callback = function()
        vim.keymap.set("n", "Y", function()
          local state = require("neo-tree.sources.manager").get_state("filesystem")
          local node = state.tree:get_node()
          if node then
            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local results = {
              filepath,
              modify(filepath, ":."),
              modify(filepath, ":~"),
              filename,
              modify(filename, ":r"),
              modify(filename, ":e"),
            }

            vim.ui.select({
              "1. Absolute path: " .. results[1],
              "2. Path relative to CWD: " .. results[2],
              "3. Path relative to HOME: " .. results[3],
              "4. Filename: " .. results[4],
              "5. Filename w/o extension: " .. results[5],
              "6. Extension: " .. results[6],
            }, { prompt = "Choose to copy:" }, function(choice)
              if choice then
                local i = tonumber(choice:sub(1, 1))
                if i then
                  vim.fn.setreg("+", results[i])
                  vim.notify("Copied: " .. results[i])
                end
              end
            end)
          end
        end, { buffer = true })
      end,
    })
  '';
}
