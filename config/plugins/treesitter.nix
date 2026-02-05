{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      highlight.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          scope_incremental = false;
          node_decremental = "<bs>";
        };
      };
    };
    folding.enable = false;
    nixvimInjections = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      lua
      nix
      vim
      vimdoc
      query
      javascript
      typescript
      tsx
      vue
      html
      css
      scss
      json
      json5
      yaml
      toml
      bash
      fish
      dockerfile
      markdown
      markdown_inline
      go
      gomod
      gosum
      python
      php
      clojure
      elixir
      gleam
      regex
      git_config
      gitcommit
      gitignore
    ];
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = {
            query = "@parameter.outer";
            desc = "Around parameter";
          };
          "ia" = {
            query = "@parameter.inner";
            desc = "Inside parameter";
          };
          "af" = {
            query = "@function.outer";
            desc = "Around function";
          };
          "if" = {
            query = "@function.inner";
            desc = "Inside function";
          };
          "ac" = {
            query = "@class.outer";
            desc = "Around class";
          };
          "ic" = {
            query = "@class.inner";
            desc = "Inside class";
          };
          "ai" = {
            query = "@conditional.outer";
            desc = "Around conditional";
          };
          "ii" = {
            query = "@conditional.inner";
            desc = "Inside conditional";
          };
          "al" = {
            query = "@loop.outer";
            desc = "Around loop";
          };
          "il" = {
            query = "@loop.inner";
            desc = "Inside loop";
          };
        };
      };
      move = {
        enable = true;
        set_jumps = true;
        goto_next_start = {
          "]m" = {
            query = "@function.outer";
            desc = "Next function start";
          };
          "]]" = {
            query = "@class.outer";
            desc = "Next class start";
          };
        };
        goto_next_end = {
          "]M" = {
            query = "@function.outer";
            desc = "Next function end";
          };
          "][" = {
            query = "@class.outer";
            desc = "Next class end";
          };
        };
        goto_previous_start = {
          "[m" = {
            query = "@function.outer";
            desc = "Prev function start";
          };
          "[[" = {
            query = "@class.outer";
            desc = "Prev class start";
          };
        };
        goto_previous_end = {
          "[M" = {
            query = "@function.outer";
            desc = "Prev function end";
          };
          "[]" = {
            query = "@class.outer";
            desc = "Prev class end";
          };
        };
      };
      swap = {
        enable = true;
        swap_next = {
          "<leader>a" = "@parameter.inner";
        };
        swap_previous = {
          "<leader>A" = "@parameter.outer";
        };
      };
    };
  };
}
