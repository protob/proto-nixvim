{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
      fzf-native = {
        enable = true;
      };
    };
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options.desc = "Find Files";
      };
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep (root dir)";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find Files";
      };
      "<leader>fr" = {
        action = "oldfiles";
        options.desc = "Recent Files";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Buffers";
      };
      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Grep";
      };
      "<leader>fR" = {
        action = "resume";
        options.desc = "Resume";
      };
      "<C-p>" = {
        action = "git_files";
        options.desc = "Git Files";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Git Commits";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Git Status";
      };
      "<leader>sa" = {
        action = "autocommands";
        options.desc = "Auto Commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Buffer";
      };
      "<leader>sc" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>sC" = {
        action = "commands";
        options.desc = "Commands";
      };
      "<leader>sd" = {
        action = "diagnostics";
        options.desc = "Diagnostics";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "Help Pages";
      };
      "<leader>sH" = {
        action = "highlights";
        options.desc = "Highlight Groups";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "Keymaps";
      };
      "<leader>sm" = {
        action = "marks";
        options.desc = "Marks";
      };
      "<leader>sR" = {
        action = "resume";
        options.desc = "Resume";
      };
      "<leader>uC" = {
        action = "colorscheme";
        options.desc = "Colorscheme";
      };
    };
  };

  extraConfigLua = ''
    require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
    }
  '';
}
