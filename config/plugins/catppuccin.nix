{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "macchiato";
      background = {
        light = "macchiato";
        dark = "mocha";
      };
      no_bold = false;
      no_italic = false;
      no_underline = false;
      transparent_background = false;
      integrations = {
        blink_cmp = true;
        gitsigns = true;
        neotree = true;
        which_key = true;
        treesitter = true;
        telescope.enabled = true;
        indent_blankline.enabled = true;
        mini = {
          enabled = true;
          indentscope_color = "rosewater";
        };
        native_lsp = {
          enabled = true;
          inlay_hints = {
            background = true;
          };
          virtual_text = {
            errors = [ "italic" ];
            hints = [ "italic" ];
            information = [ "italic" ];
            warnings = [ "italic" ];
            ok = [ "italic" ];
          };
          underlines = {
            errors = [ "underline" ];
            hints = [ "underline" ];
            information = [ "underline" ];
            warnings = [ "underline" ];
          };
        };
      };
    };
  };
}
