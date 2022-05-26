local M = {}

function M.get_colors(type, theme_name)
   local name = vim.g.base46_config.theme or theme_name or "onedark"

   local path = "base46.themes." .. name

   local ok, theme = pcall(require, path)

   if ok then
      return theme[type]
   else
      error("Cannot find theme " .. name)
   end
end

function M.setup(opts)
   vim.g.base46_config = opts or { }
   vim.opt.bg = M.get_colors "type" or "dark"
   vim.opt.termguicolors = true

   require "base46.highlights"
end

return M
