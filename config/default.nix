{ pkgs, lib, ... }:
{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocmds.nix
    ./plugins/catppuccin.nix
    ./plugins/treesitter.nix
    ./plugins/lsp.nix
    ./plugins/conform.nix
    ./plugins/blink-cmp.nix
    ./plugins/telescope.nix
    ./plugins/neo-tree.nix
    ./plugins/toggleterm.nix
    ./plugins/bufferline.nix
    ./plugins/lualine.nix
    ./plugins/gitsigns.nix
    ./plugins/lazygit.nix
    ./plugins/which-key.nix
    ./plugins/indent-blankline.nix
    ./plugins/mini.nix
    ./plugins/snacks.nix
    ./plugins/todo-comments.nix
    ./plugins/web-devicons.nix
  ];

  config = {
    # Suppress nixvim/nixpkgs version mismatch warning when used with a stable host flake
    version.enableNixpkgsReleaseCheck = false;

    extraPackages = with pkgs; [
      ripgrep
      fd
      fzf
      # formatters
      prettierd
      nixfmt
      shfmt
      black
      isort
      stylua
      gofumpt
      goimports-reviser
      # linters
      shellcheck
      eslint_d
    ];
  };
}
