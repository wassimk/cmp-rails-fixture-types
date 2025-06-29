# cmp-rails-fixture-types

This plugin is a source for [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) to complete Ruby on Rails fixture **types**. Types meaning the object each fixture represents. So a `User` model would have a `users` fixture type.

There is a companion plugin, called [cmp-rails-fixture-names](https://github.com/wassimk/cmp-rails-fixture-names) that completes the fixture **names**. So if you have a user fixture called `bob`. The companion will auto-complete the fixture name _bob_ when you type `users(:`.

## Setup

### Prerequisites

Fixtures must exist in the default location of `test/fixtures` or `spec/fixtures` and be `.yml` files.

This plugin regex parses the YAML files for completion data so anything fancy like a Ruby loop that generates fixtures will likely break.

### Installation

#### Using with nvim-cmp

Install **cmp-rails-fixture-types** using your plugin manager of choice. For example, here it is using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "wassimk/cmp-rails-fixture-types", version = "*", ft = "ruby" },
  },
}
```

Then add `rails-fixture-types` source in your **nvim-cmp** configuration:

```lua
require("cmp").setup {
  -- ...
  sources = {
    { name = "rails-fixture-types" },
    -- other sources ...
  },
  -- ...
}
```

#### Using with blink.cmp

Since [**blink.cmp**](https://github.com/Saghen/blink.cmp) doesn't directly support **nvim-cmp** sources, you'll need to use the [**blink.compat**](https://github.com/saghen/blink.compat) compatibility layer. Install both plugins:

```lua
{
  'saghen/blink.compat',
  version = '2.*',
  lazy = true,
  opts = {},
  dependencies = {
    { 'wassimk/cmp-rails-fixture-types', version = '*', ft = 'ruby' },
  },
},
{
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    sources = {
      per_filetype = {
        ruby = {
          inherit_defaults = true,
          'rails_fixture_types'
        },
      },
      providers = {
        rails_fixture_types = {
          name = 'rails_fixture_types',
          module = 'blink.compat.source',
        },
      },
    },
  },
}
```
