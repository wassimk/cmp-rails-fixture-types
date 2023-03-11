local types = require('cmp_rails_fixture_types.types')

local M = {}

M.new = function()
  return setmetatable({}, { __index = M })
end

M.is_available = function()
  local current_buffer_path = vim.fn.expand('%')

  return vim.bo.filetype == 'ruby'
    and (
      vim.startswith(current_buffer_path, 'test/') or vim.startswith(current_buffer_path, 'spec/')
    )
end

M.complete = function(_, _, callback)
  local results = {}

  for _, type in ipairs(types.all()) do
    local cmp_item = {
      label = type,
      word = type .. '(',
    }
    table.insert(results, cmp_item)
  end

  callback(results)
end

return M
