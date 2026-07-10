vim.g.mapleader = " "

vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result cursor centered" })

vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart config :restart)" })

-- native undotree
vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })

-- Cycle to previous/next buffer using Shift-H and Shift-L
vim.keymap.set("n", "<S-h>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Close current buffer using Leader + c
vim.keymap.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close current buffer" })

-- MiniPick
vim.keymap.set("n", "<leader>f", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>g", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Grep word/Search word" })
vim.keymap.set("n", "<leader>h", function() MiniPick.builtin.help() end, { desc = "Mini Help" })

vim.keymap.set("n", "<leader>x", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Picker Diagnostics" })
vim.keymap.set("n", "<leader>k", function() MiniExtra.pickers.keymaps() end, { desc = 'Search keymaps' })

-- Navigate completion menu with Alt+j and Alt+k
vim.keymap.set('i', '<M-j>', function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<M-j>'
end, { expr = true, desc = "Next completion item" })

vim.keymap.set('i', '<M-k>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<M-k>'
end, { expr = true, desc = "Previous completion item" })

-- Mini Jump
vim.keymap.set("n", "s", "<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>", { desc = 'Jump to specific char' })

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.diagnostic.config({ virtual_text = true })
