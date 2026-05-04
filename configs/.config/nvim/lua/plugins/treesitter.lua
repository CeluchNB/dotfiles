return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({ 
      ensure_installed = { "lua", "python", "javascript", "typescript", "bash", "rust", "ruby", "go" },
      highlight = { enable = true },
    })
  end,
}
