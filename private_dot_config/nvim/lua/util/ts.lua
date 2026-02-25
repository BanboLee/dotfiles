local M = {}

local vt = vim.treesitter

function M.get_func_range()
  local node = vt.get_node()
  while node do
    local node_type = node:type()
    if node_type == "function_declaration" or node_type == "method_declaration" then
      local start_line, start_col, end_line, end_col = node:range()
      return {
        start_line = start_line,
        start_col = start_col,
        end_line = end_line,
        end_col = end_col,
      }
    end
    node = node:parent()
  end
end

return M
