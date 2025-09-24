return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ts_ls",
        "yamlls",
        "lua_ls",
        "bashls",
        "html",
        "pyright",
        "kotlin_language_server",
        "lemminx", -- XML
        "jsonls", -- JSON
        "marksman", -- Markdown
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ensure_installed = {
            "ktlint",
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {},
        yamlls = {},
        bashls = {},
        html = {},
        pyright = {},
        kotlin_language_server = {

          -- root_dir = function(fname)
          --   local util = require("lspconfig.util")
          --   return util.root_pattern(
          --     "settings.gradle",
          --     "settings.gradle.kts",
          --     "build.gradle",
          --     "build.gradle.kts",
          --     "pom.xml",
          --     ".git"
          --   )(fname)
          -- end,
        },
        lemminx = {},
        jsonls = {},
        marksman = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- kotlin_language_server = function(_, _)
        --   -- Optional: auto-organize imports on save
        --   local grp = vim.api.nvim_create_augroup("KotlinImports", { clear = true })
        --   vim.api.nvim_create_autocmd("BufWritePre", {
        --     group = grp,
        --     pattern = { "*.kt", "*.kts" },
        --     callback = function()
        --       vim.lsp.buf.code_action({
        --         context = { only = { "source.organizeImports" }, diagnostics = {} },
        --         apply = true,
        --       })
        --     end,
        --   })
        -- end,
      },
    },
  },
}
