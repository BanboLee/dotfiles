local M = {}

function M.projects()
  local project = require("project_nvim.project")
  local history = require("project_nvim.utils.history")
  local results = history.get_recent_projects()
  local items = {}
  for i, dir in ipairs(results) do
    -- Snacks.notify.notify(dir)
    table.insert(items, {
      idx = i,
      score = i,
      text = dir,
      name = dir,
      file = dir,
    })
  end
  return Snacks.picker({
    items = items,
    preview = "directory",
    format = "text",
    ---@param a snacks.picker.Item
    ---@param b snacks.picker.Item
    sort = function(a, b)
      return a.name < b.name
    end,
    matcher = {
      fuzzy = false,
    },
    confirm = function(_, item)
      local ok = project.set_pwd(item.text)
      if ok then
        LazyVim.info("change project dir to " .. item.text)
      end
      Snacks.picker.files({ cwd = item.text, hidden = true })
    end,
    win = {
      input = {
        keys = {
          ["<c-d>"] = {
            "delete_project",
            mode = { "n", "i" },
          },
          -- ["<c-w>"] = {
          --   "change_pwd",
          --   mode = { "n", "i" },
          -- },
        },
      },
    },
    actions = {
      delete_project = function(_, item)
        local path = item.file
        local choice = vim.fn.confirm("Delete '" .. path .. "' project? ", "&Yes\n&No")
        if choice == 1 then
          history.delete_project({ value = path })
        end
        M.projects()
      end,
      change_pwd = function(_, item)
        local ok = project.set_pwd(item.text)
        if ok then
          LazyVim.info("change project dir to " .. item.text)
          Snacks.picker.files({ hidden = true })
        end
      end,
    },
  })
end

return M
