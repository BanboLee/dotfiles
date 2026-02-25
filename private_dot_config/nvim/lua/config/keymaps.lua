-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- coding
map("i", "<C-c>", "<esc>", { desc = "Escape insert mode" })
map("n", "<C-c>", "<esc>", { desc = "Cancel Action" })
map("v", "<C-c>", "<esc>", { desc = "Escape visual selection mode" })

-- LSP
wk.add({
  { "<leader>cs", "<Cmd>LspRestart<Cr>", desc = "Load Lsp" },
})

-- Override fzf keymaps
wk.add({
  {
    "<leader>fe",
    function()
      Snacks.explorer()
    end,
    desc = "Explorer Snacks (cwd)",
  },
  {
    "<leader>fE",
    function()
      Snacks.explorer({ cwd = LazyVim.root() })
    end,
    desc = "Explorer Snacks (root dir)",
  },
  { "<leader>e", "<leader>fe", desc = "Explorer Snacks (cwd)", remap = true },
  { "<leader>E", "<leader>fE", desc = "Explorer Snacks (root dir)", remap = true },

  { "<leader>ff", LazyVim.pick("files", { root = false, hidden = true }), desc = "Find Files (cwd)" },
  { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  { "<leader>fr", LazyVim.pick("oldfiles", { filter = { cwd = true } }), desc = "Recent (cwd)" },
  { "<leader>fR", LazyVim.pick("oldfiles"), desc = "Recent" },
  { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
  { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  {
    "<leader>sw",
    LazyVim.pick("grep_word", { root = false }),
    desc = "Visual selection or Word (cwd)",
    mode = { "n", "x" },
  },
  { "<leader>sW", LazyVim.pick("grep_word"), desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
  { "<leader>fp", require("util.projects").projects, desc = "Projects" },
})

-- AI
-- wk.add({
--   {
--     "<leader>a",
--     group = "AI",
--   },
--   {
--     "<leader>at",
--     "<Cmd>CodeCompanionChat Toggle<Cr>",
--     desc = "Ask AI",
--     remap = true,
--     mode = { "n", "v" },
--   },
--   {
--     "<leader>aa",
--     "<Cmd>CodeCompanionActions<Cr>",
--     desc = "AI actions",
--     remap = true,
--     mode = { "n", "v" },
--   },
--   {
--     "<leader>ac",
--     "<Cmd>CodeCompanionCmd<Cr>",
--     desc = "AI cmd",
--     remap = true,
--     mode = { "n", "v" },
--   },
--   {
--     "<leader>ai",
--     "<Cmd>'<,'>CodeCompanion<Cr>",
--     desc = "AI inline assistant",
--     remap = true,
--     mode = { "n", "v" },
--   },
--   {
--     "<leader>au",
--     "<Cmd>'<,'>CodeCompanion /tests<Cr>",
--     desc = "",
--     remap = true,
--     mode = { "n", "v" },
--   },
-- })
