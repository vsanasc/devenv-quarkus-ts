return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          shell = "zsh",
          style = "float",
          width = math.floor(vim.o.columns * 0.9),
          height = math.floor(vim.o.lines * 0.9),
        },
      },
      picker = {
        sources = {
          explorer = {
            auto_close = true,
          },
        },
      },
    },
  },
}
