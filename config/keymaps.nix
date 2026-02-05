{
  keymaps = [
    # -- Better j/k on wrapped lines --
    {
      mode = [ "n" "x" ];
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = { expr = true; silent = true; };
    }
    {
      mode = [ "n" "x" ];
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = { expr = true; silent = true; };
    }

    # -- Window navigation (normal mode) --
    { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options = { desc = "Go to Left Window"; remap = true; }; }
    { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options = { desc = "Go to Lower Window"; remap = true; }; }
    { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options = { desc = "Go to Upper Window"; remap = true; }; }
    { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options = { desc = "Go to Right Window"; remap = true; }; }

    # -- Window navigation (terminal mode) --
    { mode = "t"; key = "<C-h>"; action = "<cmd>wincmd h<cr>"; options = { desc = "Go to Left Window"; }; }
    { mode = "t"; key = "<C-j>"; action = "<cmd>wincmd j<cr>"; options = { desc = "Go to Lower Window"; }; }
    { mode = "t"; key = "<C-k>"; action = "<cmd>wincmd k<cr>"; options = { desc = "Go to Upper Window"; }; }
    { mode = "t"; key = "<C-l>"; action = "<cmd>wincmd l<cr>"; options = { desc = "Go to Right Window"; }; }
    { mode = "t"; key = "<Esc>"; action = "<C-\\><C-n>"; options = { desc = "Exit Terminal Mode"; }; }

    # -- Window resize --
    { mode = "n"; key = "<C-Up>"; action = "<cmd>resize +2<cr>"; options = { desc = "Increase Window Height"; }; }
    { mode = "n"; key = "<C-Down>"; action = "<cmd>resize -2<cr>"; options = { desc = "Decrease Window Height"; }; }
    { mode = "n"; key = "<C-Left>"; action = "<cmd>vertical resize -2<cr>"; options = { desc = "Decrease Window Width"; }; }
    { mode = "n"; key = "<C-Right>"; action = "<cmd>vertical resize +2<cr>"; options = { desc = "Increase Window Width"; }; }

    # -- Move lines --
    { mode = "n"; key = "<A-j>"; action = "<cmd>m .+1<cr>=="; options = { desc = "Move Down"; }; }
    { mode = "n"; key = "<A-k>"; action = "<cmd>m .-2<cr>=="; options = { desc = "Move Up"; }; }
    { mode = "i"; key = "<A-j>"; action = "<esc><cmd>m .+1<cr>==gi"; options = { desc = "Move Down"; }; }
    { mode = "i"; key = "<A-k>"; action = "<esc><cmd>m .-2<cr>==gi"; options = { desc = "Move Up"; }; }
    { mode = "v"; key = "<A-j>"; action = ":m '>+1<cr>gv=gv"; options = { desc = "Move Down"; }; }
    { mode = "v"; key = "<A-k>"; action = ":m '<-2<cr>gv=gv"; options = { desc = "Move Up"; }; }

    # -- Save file --
    {
      mode = [ "i" "x" "n" "s" ];
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = { desc = "Save File"; };
    }

    # -- Clear search --
    {
      mode = [ "i" "n" ];
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options = { desc = "Escape and Clear hlsearch"; };
    }

    # -- Window splits (LazyVim style) --
    { mode = "n"; key = "<leader>ww"; action = "<C-W>p"; options = { desc = "Other Window"; remap = true; }; }
    { mode = "n"; key = "<leader>wd"; action = "<C-W>c"; options = { desc = "Delete Window"; remap = true; }; }
    { mode = "n"; key = "<leader>w-"; action = "<C-W>s"; options = { desc = "Split Window Below"; remap = true; }; }
    { mode = "n"; key = "<leader>w|"; action = "<C-W>v"; options = { desc = "Split Window Right"; remap = true; }; }
    { mode = "n"; key = "<leader>-"; action = "<C-W>s"; options = { desc = "Split Window Below"; remap = true; }; }
    { mode = "n"; key = "<leader>|"; action = "<C-W>v"; options = { desc = "Split Window Right"; remap = true; }; }

    # -- Tabs --
    { mode = "n"; key = "<leader><tab>l"; action = "<cmd>tablast<cr>"; options = { desc = "Last Tab"; }; }
    { mode = "n"; key = "<leader><tab>f"; action = "<cmd>tabfirst<cr>"; options = { desc = "First Tab"; }; }
    { mode = "n"; key = "<leader><tab><tab>"; action = "<cmd>tabnew<cr>"; options = { desc = "New Tab"; }; }
    { mode = "n"; key = "<leader><tab>]"; action = "<cmd>tabnext<cr>"; options = { desc = "Next Tab"; }; }
    { mode = "n"; key = "<leader><tab>d"; action = "<cmd>tabclose<cr>"; options = { desc = "Close Tab"; }; }
    { mode = "n"; key = "<leader><tab>["; action = "<cmd>tabprevious<cr>"; options = { desc = "Previous Tab"; }; }

    # -- Quit --
    { mode = "n"; key = "<leader>qq"; action = "<cmd>qa<cr>"; options = { desc = "Quit All"; }; }

    # -- LSP --
    { mode = "n"; key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; options = { desc = "Hover"; }; }
    { mode = "n"; key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; options = { desc = "Goto Definition"; }; }
    { mode = "n"; key = "gD"; action = "<cmd>lua vim.lsp.buf.declaration()<cr>"; options = { desc = "Goto Declaration"; }; }
    { mode = "n"; key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; options = { desc = "Goto References"; }; }
    { mode = "n"; key = "gI"; action = "<cmd>lua vim.lsp.buf.implementation()<cr>"; options = { desc = "Goto Implementation"; }; }
    { mode = "n"; key = "gy"; action = "<cmd>lua vim.lsp.buf.type_definition()<cr>"; options = { desc = "Goto Type Definition"; }; }
    { mode = "n"; key = "<leader>cr"; action = "<cmd>lua vim.lsp.buf.rename()<cr>"; options = { desc = "Rename"; }; }
    { mode = [ "n" "v" ]; key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<cr>"; options = { desc = "Code Action"; }; }
    { mode = "n"; key = "<leader>cd"; action = "<cmd>lua vim.diagnostic.open_float()<cr>"; options = { desc = "Line Diagnostics"; }; }
    { mode = "n"; key = "]d"; action = "<cmd>lua vim.diagnostic.goto_next()<cr>"; options = { desc = "Next Diagnostic"; }; }
    { mode = "n"; key = "[d"; action = "<cmd>lua vim.diagnostic.goto_prev()<cr>"; options = { desc = "Prev Diagnostic"; }; }

    # -- Format --
    { mode = [ "n" "v" ]; key = "<leader>cf"; action = "<cmd>lua require('conform').format({ async = true })<cr>"; options = { desc = "Format"; }; }
  ];
}
