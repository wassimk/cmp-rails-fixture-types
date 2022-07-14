local has_scan, scan = pcall(require, 'plenary.scandir')
if not has_scan then
  vim.notify('Need the plenary plugin installed for cmp-rails-fixture-types to work')
  return
end

local rails_fixture_types = {}

function rails_fixture_types.all()
  local fixtures_dir = './test/fixtures'

  local success, types = pcall(function()
    local types = {}
    local files = scan.scan_dir(fixtures_dir, { search_pattern = '.yml', respect_gitignore = true,
      silent = true })

    for _, file in ipairs(files) do
      local type = file:match(fixtures_dir .. '/(.+)%.yml$')
      type = type:gsub('/', '_')

      table.insert(types, type)
    end

    return types
  end)
  if not success then
    return {}
  end

  return types
end

return rails_fixture_types
