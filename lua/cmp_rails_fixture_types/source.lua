local types = require('cmp_rails_fixture_types.types')

local source = {}

source.new = function()
  return setmetatable({}, { __index = source })
end

source.is_available = function()
  local current_buffer_path = vim.fn.expand('%')

  return vim.startswith(current_buffer_path, 'test/') or vim.startswith(current_buffer_path, 'spec/')
end

source.complete = function(_, request, callback)
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

return source
