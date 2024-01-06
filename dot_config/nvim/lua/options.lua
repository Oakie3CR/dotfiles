local opt = vim.opt
local g = vim.g

opt.title = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.cul = true -- cursor line

-- Indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

-- disable tilde on end of buffer: https://github.com/neovim/neovim/pull/8546#issuecomment-643643758
opt.fillchars = { eob = " " }

opt.hidden = false
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("cfiIlmnrxoOstT")

opt.signcolumn = "yes"
opt.splitbelow = false -- this is my current config Let's see if I like it...
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 400 -- this is the nvchad default. What do I like?
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
opt.wrap = true
opt.linebreak = true
opt.showbreak = "> "

g.mapleader = " "
g.maplocalleader = " "

-- This enables better completion in command mode
opt.wildmode = "list:longest,full"

-- disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
