{ pkgs, ... }:
{
  plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        keymap = {
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-e>" = [
            "hide"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<Tab>" = [
            "select_next"
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "snippet_backward"
            "fallback"
          ];
          "<Up>" = [
            "select_prev"
            "fallback"
          ];
          "<Down>" = [
            "select_next"
            "fallback"
          ];
          "<C-p>" = [
            "select_prev"
            "fallback"
          ];
          "<C-n>" = [
            "select_next"
            "fallback"
          ];
          "<C-up>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-down>" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };

        signature = {
          enabled = true;
          window = {
            border = "rounded";
          };
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          providers = {
            lsp.score_offset = 4;
          };
        };

        appearance = {
          nerd_font_variant = "mono";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";
            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";
            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";
            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";
            Keyword = "󰻾";
            Constant = "󰏿";
            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
          };
        };

        completion = {
          menu = {
            border = "rounded";
            draw = {
              gap = 1;
              treesitter = [ "lsp" ];
              columns = [
                { __unkeyed-1 = "label"; }
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "kind";
                  gap = 1;
                }
                { __unkeyed-1 = "source_name"; }
              ];
            };
          };
          trigger = {
            show_in_snippet = false;
          };
          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
            };
          };
          accept = {
            auto_brackets = {
              enabled = false;
            };
          };
        };
      };
    };
  };
}
