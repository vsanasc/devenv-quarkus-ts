return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        -- Main
        "typescript",
        "tsx",
        "python",
        "kotlin",
        "yaml",

        -- Secondary
        "javascript",
        "jsx",
        "json",
        "xml",
        "html",
        "bash",

        -- Extras
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "vim",
      },
    },
  },
}
