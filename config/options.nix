{ pkgs, ... }:
{
  config = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    clipboard = {
      providers.wl-copy.enable = pkgs.stdenv.isLinux;
    };

    opts = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      breakindent = true;
      wrap = false;
      cursorline = true;
      scrolloff = 8;
      sidescrolloff = 8;
      signcolumn = "yes";
      mouse = "a";
      termguicolors = true;
      showmode = false;
      swapfile = false;
      backup = false;
      undofile = true;
      hlsearch = false;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      timeoutlen = 300;
      splitbelow = true;
      splitright = true;
      splitkeep = "screen";
      cmdheight = 0;
      showtabline = 2;
      foldmethod = "manual";
      foldenable = false;
      foldlevelstart = 99;
      fillchars = {
        eob = " ";
      };
    };
  };
}
