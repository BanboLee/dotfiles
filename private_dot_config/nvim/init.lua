-- custom

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.g.snacks_animate = false

require("dap").set_log_level("TRACE")

require("sidekick").setup({
  nes = {
    enabled = false,
  },
  cli = {
    tools = {
      coco = {
        cmd = { "coco" },
      },
    },
    mux = {
      backend = "zellij",
      enabled = true,
    },
  },
})
