return {
  'stevearc/conform.nvim',
  opts = {},
  config = function ()
    require("conform").setup({

      formatters_by_ft = {
        -- Web
        javascript      = { "prettier" },
        typescript      = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css             = { "prettier" },
        html            = { "prettier" },
        json            = { "prettier" },
        yaml            = { "prettier" },
        markdown        = { "prettier" },

        -- Python
        python = { "black", "isort" },  -- runs black first, then isort

        -- Go
        go = { "gofmt", "goimports" },

        -- Ruby
        ruby = { "rubocop" },

        -- Rust (handled by rust-analyzer, but can use rustfmt directly)
        rust = { "rustfmt" },

        -- Lua
        lua = { "stylua" },

        -- Fallback for anything else
        ["*"] = { "trim_whitespace" },
      },
      format_on_save = {
        timeout_ms = 5000,
        lsp_format = "fallback"
      }
    })

    -- Manual format keymap
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({
        async          = true,
        lsp_fallback   = true,
      })
    end, { desc = "Format buffer" })
  end,
}
