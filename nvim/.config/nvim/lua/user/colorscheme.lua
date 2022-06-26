--local colorscheme = "darkplus"
vim.cmd([[let g:sonokai_style = 'espresso']])
local colorscheme = "sonokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
