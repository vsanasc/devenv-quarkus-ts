return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          "%.DS_Store",
          "dist/",
          "build/",
          ".*%.log",
          ".*%.lock",
          ".*%.png",
          ".*%.jpg",
          ".*%.pdf",
          ".*%.ico",
          ".*%.ttf",
          ".*%.woff2",
          ".*%.woff",
          ".*%.eot",
        },
      },
    },
  },
}
