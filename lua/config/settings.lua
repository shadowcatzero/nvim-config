local u = require 'config.utils'
local o = vim.o

-- basic stuff
o.number = true
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
o.cmdheight = 2
vim.g.mapleader = ' '

-- line break (wrapping) settings
o.linebreak = true
o.breakindent = true
o.showbreak = '\\ '

-- lines after end of file empty instead of ~ (fillchars)
o.fcs = 'eob: '

-- tab
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4

-- turn of gui colors if in tty
if os.getenv('TERM') ~= 'linux' then
    o.termguicolors = true
else
    o.termguicolors = false
end

-- diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = { prefix = '●' };
})

-- terminal
local m = u.mapping
m.map('t', '<esc>', '<C-\\><C-n>')
m.map('t', '<C-n>', '<C-\\><C-n><C-w>h')
m.map('t', '<C-e>', '<C-\\><C-n><C-w>j')
m.map('t', '<C-i>', '<C-\\><C-n><C-w>k')
m.map('t', '<C-o>', '<C-\\><C-n><C-w>l')
m.nmap('<leader>tm', '<cmd>belowright 7sp<cr><cmd>term<cr><cmd>setlocal nonu<cr>A')

-- off search highlight when escape is pressed
m.nmap('<esc>', '<cmd>noh<cr><esc>')

-- yank to clipboard
m.map('v', '<leader>y', '"+y')

-- spell checking
m.cmd('<leader>sp', 'setlocal spell spelllang=en_us')
m.cmd('<leader>nsp', 'setlocal nospell')

-- colemak-dh
local l = u.layout
l.swap('n', 'h')
l.swap('e', 'j')
l.swap('i', 'k')
l.swap('o', 'l')

l.swap('<C-w>n', '<C-w>h')
l.swap('<C-w>e', '<C-w>j')
l.swap('<C-w>i', '<C-w>k')
l.swap('<C-w>o', '<C-w>l')
l.swap('<C-w>N', '<C-w>H')
l.swap('<C-w>E', '<C-w>J')
l.swap('<C-w>I', '<C-w>K')
l.swap('<C-w>O', '<C-w>L')

l.swap('N', 'H')
l.swap('O', 'L')

l.swap('<C-n>', '<C-w>h')
l.swap('<C-e>', '<C-w>j')
l.swap('<C-i>', '<C-w>k')
l.swap('<C-o>', '<C-w>l')

