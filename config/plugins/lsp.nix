{ pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      # Primary languages
      ts_ls = {
        enable = true;
      };
      vue_ls = {
        enable = true;
      };
      tailwindcss = {
        enable = true;
      };
      html = {
        enable = true;
      };
      cssls = {
        enable = true;
      };
      gopls = {
        enable = true;
      };
      bashls = {
        enable = true;
      };
      nil_ls = {
        enable = true;
      };
      marksman = {
        enable = true;
      };
      jsonls = {
        enable = true;
      };
      yamlls = {
        enable = true;
        extraOptions = {
          settings = {
            yaml = {
              schemas = {
                kubernetes = "'*.yaml";
                "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                  "*docker-compose*.{yml,yaml}";
              };
            };
          };
        };
      };
      eslint = {
        enable = true;
      };
      lua_ls = {
        enable = true;
      };

      # Secondary languages
      pyright = {
        enable = true;
      };
      elixirls = {
        enable = true;
      };
      clojure_lsp = {
        enable = true;
      };
      phpactor = {
        enable = true;
      };
    };

    keymaps = {
      silent = true;
      diagnostic = {
        "<leader>cd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_prev";
          desc = "Prev Diagnostic";
        };
        "]d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
      };
    };
  };

  plugins.lsp-format = {
    enable = true;
  };

  plugins.fidget = {
    enable = true;
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float = { border = _border }
    }

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
