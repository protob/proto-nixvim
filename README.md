# Proto-NixVim

Deterministic Neovim configuration built with NixVim. LazyVim-style keybindings and UX.

## Features

### Core
- **Fully deterministic** — all plugins, LSPs, formatters, and treesitter grammars are pinned via Nix. Nothing downloads at runtime
- **Zero Mason** — all language servers managed by Nix, not Mason
- **LazyVim-style keybindings** — Space leader, familiar `<leader>ff`, `<leader>e`, `<leader>gg`, etc.
- **Which-key** — discoverable keybindings with prefix groups

### Editor
- **Neo-tree** — file explorer with git status, document symbols, Y keybind for copying file paths
- **Telescope** — fuzzy finder with fzf-native, file browser extension
- **Bufferline** — buffer tabs with Shift+H/L cycling, pin support
- **Lualine** — statusline with git branch, diagnostics, file path
- **Indent-blankline** — indent guides
- **Todo-comments** — highlight and search TODO/FIXME/HACK comments
- **Snacks** — dashboard on startup + notification system

### Completion & LSP
- **Blink-cmp** — modern completion engine with signature help, kind icons, rounded borders
- **15 LSP servers** — TypeScript, Vue, Tailwind, HTML, CSS, Go, Bash, Nix, Markdown, JSON, YAML, ESLint, Lua, Python, PHP, Clojure, Elixir
- **Fidget** — LSP progress indicator
- **Inlay hints** enabled

### Formatting (conform.nvim)
- **Prettierd** — JS, TS, Vue, HTML, CSS, JSON, YAML, Markdown
- **gofumpt + goimports-reviser** — Go
- **nixfmt** — Nix
- **shfmt + shellcheck** — Bash
- **black + isort** — Python
- **stylua** — Lua
- Format on save with auto-disable for slow formatters
- `:FormatToggle`, `:FormatDisable`, `:FormatEnable` commands

### Treesitter
- **30+ grammars** — Lua, Nix, JS, TS, TSX, Vue, HTML, CSS, SCSS, JSON, YAML, TOML, Bash, Fish, Dockerfile, Markdown, Go, Python, PHP, Clojure, Elixir, Gleam, and more
- **Textobjects** — select/move/swap around functions, classes, parameters, loops, conditionals
- **Incremental selection** — Ctrl+Space to expand, Backspace to shrink

### Git
- **Gitsigns** — gutter signs, hunk staging/resetting/previewing, blame
- **LazyGit** — full git UI via `<leader>gg`

### Terminal
- **ToggleTerm** — 3 numbered horizontal terminals
  - `<leader>1/2/3` — quick toggle
  - `<leader>t1/t2/t3` — toggle with explicit size
  - `<leader>ta` — open all 3
  - `<leader>tc` — close all
  - `Ctrl+/` — toggle terminal 1
  - `Ctrl+hjkl` — navigate between terminal and editor windows
  - `Esc` — exit terminal mode

### Other
- **mini.pairs** — auto-pairs (disabled in markdown)
- **mini.surround** — surround operations
- **mini.comment** — comment toggling
- **Catppuccin** theme (Macchiato)
- Markdown conceallevel set to 0
- Highlight on yank
- Remember last cursor position

## Usage

### Run directly (one-time, no install)

```bash
# Run from local path
git https://github.com/protob/proto-nixvim.git
cd proto-nixvim
nix run .

# Run from GitHub (after pushing to a repo)
nix run github:protob/proto-nixvim
```

### Dev shell

```bash
nix develop .
nvim
```

### Add to a NixOS system config (~/.setup)

#### 1. Add as flake input

In `~/.setup/flake.nix`, add the input:

```nix
{
  inputs = {
    # ... existing inputs ...
    proto-nixvim = {
      url = "github:protob/proto-nixvim"; # or path if local
      # url = "path:/home/username/Documents/proto-nixvim"; # local path
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

#### 2. Pass it through to the config

In the flake outputs, pass `proto-nixvim` to the modules via `specialArgs` or overlay:

```nix
# In flake.nix outputs
nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs;
    # ... other args ...
  };
  # ...
};
```

#### 3. Install the package

In any module (e.g. replace the current nvim config):

```nix
{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.proto-nixvim.packages.${pkgs.system}.default
  ];
}
```

Or via Home Manager:

```nix
{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.proto-nixvim.packages.${pkgs.system}.default
  ];
}
```

#### 4. Rebuild

```bash
cd ~/.setup
git add .
sudo nixos-rebuild switch --flake .#desktop
```

## File Structure

```
proto-nixvim/
├── flake.nix                    # Flake definition
├── flake.lock                   # Pinned dependencies
├── README.md
└── config/
    ├── default.nix              # Main entry + extraPackages
    ├── options.nix              # Vim settings
    ├── keymaps.nix              # Global keybindings
    ├── autocmds.nix             # Autocommands
    └── plugins/
        ├── blink-cmp.nix        # Completion
        ├── bufferline.nix       # Buffer tabs
        ├── catppuccin.nix       # Theme
        ├── conform.nix          # Formatters
        ├── gitsigns.nix         # Git signs
        ├── indent-blankline.nix # Indent guides
        ├── lazygit.nix          # Git UI
        ├── lsp.nix              # Language servers
        ├── lualine.nix          # Statusline
        ├── mini.nix             # Pairs, surround, comment
        ├── neo-tree.nix         # File explorer
        ├── snacks.nix           # Dashboard + notifications
        ├── telescope.nix        # Fuzzy finder
        ├── todo-comments.nix    # TODO highlights
        ├── toggleterm.nix       # Terminal
        ├── treesitter.nix       # Syntax + textobjects
        ├── web-devicons.nix     # Icons
        └── which-key.nix        # Key discovery
```
