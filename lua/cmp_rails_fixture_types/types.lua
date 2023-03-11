local has_scan, scan = pcall(require, 'plenary.scandir')
if not has_scan then
  vim.notify('Need the plenary plugin installed for cmp-rails-fixture-types to work')
  return
end

local M = {}

function M.all()
  local fixture_dirs = { './test/fixtures', './spec/fixtures' }

  fixture_dirs = vim.tbl_filter(function(dir)
    return vim.fn.isdirectory(dir) == 1
  end, fixture_dirs)

  local success, types = pcall(function()
    local files = scan.scan_dir(
      fixture_dirs,
      { search_pattern = '.yml', respect_gitignore = true, silent = true }
    )

    local types = {}
    for _, file in pairs(files) do
      for _, fixture_dir in pairs(fixture_dirs) do
        local type = file:match(fixture_dir .. '/(.+)%.yml$')
        type = type:gsub('/', '_')

        table.insert(types, type)
      end
    end

    return types
  end)
  if not success then
    return {}
  end

  return types
end

return M
