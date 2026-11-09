vim.pack.add { 'https://github.com/windwp/nvim-ts-autotag' }

require('nvim-ts-autotag').setup {}

-- CSS hex-color previews using mini.nvim, which you already have.
local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
  highlighters = {
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}
