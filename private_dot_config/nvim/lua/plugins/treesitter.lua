return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "go", "python", "rst", "toml", "thrift", "ron", "rust" })
      end
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", enabled = true },
}
