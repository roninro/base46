local integrations = {
  'bufferline',
  'cmp',
  'devicons',
  'git',
  'main',
  'misc',
  'nvimtree',
  'syntax',
  'telescope',
  'treesitter',
}

local highlights = {}

for _, file in pairs(integrations) do
  local integration = require('base46.integrations.' .. file)
  highlights = vim.tbl_deep_extend('force', highlights, integration)
end

local polish_hl = require('base46').get_colors('polish_hl')
if polish_hl then
  highlights = vim.tbl_deep_extend('force', highlights, polish_hl)
end

require('base46.term_hl')

for hl, col in pairs(highlights) do
  vim.api.nvim_set_hl(0, hl, col)
end
