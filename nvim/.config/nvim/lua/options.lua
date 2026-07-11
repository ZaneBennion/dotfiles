vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = false     -- Relative line numbers

vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.tabstop = 4                -- Size of an indent
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.ignorecase = true          -- Ignore case in searches
vim.opt.smartcase = true           -- Don't ignore case if you type a capital letter
vim.opt.termguicolors = true       -- True color support
vim.opt.clipboard = "unnamedplus"  -- Yank to system clipboard

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("TextYankPost",{
    desc = "Highlight when yanking text",
    callback = function() 
        vim.hl.on_yank()
    end,
})

vim.opt.completeopt = "menuone,fuzzy,nosort"
vim.opt.shortmess:append("c")
