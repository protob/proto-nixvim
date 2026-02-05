{
  plugins.todo-comments = {
    enable = true;
  };

  keymaps = [
    { mode = "n"; key = "]t"; action = "<cmd>lua require('todo-comments').jump_next()<cr>"; options.desc = "Next TODO"; }
    { mode = "n"; key = "[t"; action = "<cmd>lua require('todo-comments').jump_prev()<cr>"; options.desc = "Prev TODO"; }
    { mode = "n"; key = "<leader>st"; action = "<cmd>TodoTelescope<cr>"; options.desc = "Search TODOs"; }
  ];
}
