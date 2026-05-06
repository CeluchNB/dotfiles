-- plugins/lsp.lua
return {
  -- Mason still handles installing servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
--      require("mason-tool-installer").setup({
--        ensure_installed = {
--          "rubocop"
--        }
--      })
    end,
  },

  -- mason-lspconfig still bridges mason with server configs
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "pyright",
          "gopls",
          "rust_analyzer",
        },
        automatic_installation = true,
      })
    end,
  },

  -- nvim-lspconfig still needed for server configs, just used differently
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()

       -- Keymaps: set up on LspAttach instead of on_attach callback
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end

          -- Navigation
          map("gd", vim.lsp.buf.definition,     "Go to definition")
          map("gD", vim.lsp.buf.declaration,    "Go to declaration")
          map("gr", vim.lsp.buf.references,     "Go to references")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")

          -- Info
          map("K",  vim.lsp.buf.hover,          "Hover docs")
          map("gs", vim.lsp.buf.signature_help, "Signature help")

          -- Actions
          map("<leader>rn", vim.lsp.buf.rename,      "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>f",  vim.lsp.buf.format,      "Format buffer")

          -- Diagnostics
          map("[d", vim.diagnostic.goto_prev,        "Prev diagnostic")
          map("]d", vim.diagnostic.goto_next,        "Next diagnostic")
          map("<leader>d", vim.diagnostic.open_float, "Show diagnostic")
        end,
      })

       -- Configure servers using the new vim.lsp.config API
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config("ruby_lsp", {
        init_options = {
          formatter = "rubocop",
          linters = { "rubocop" }
        }
      })

      -- Servers with no custom settings just need enabling
      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "pyright",
        "gopls",
        "rust_analyzer",
        "ruby_lsp",
      })

      -- Diagnostic display
      vim.diagnostic.config({
        virtual_text        = true,
        signs               = true,
        underline           = true,
        update_in_insert    = false,
        severity_sort       = true,
      })
    end,
  },
}
