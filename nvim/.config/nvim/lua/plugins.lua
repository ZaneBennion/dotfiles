vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/abecodes/tabout.nvim",
    "https://github.com/windwp/nvim-ts-autotag",
})

require("tabout").setup()
require('mini.pairs').setup()
require("mini.surround").setup()
require("mini.extra").setup()
require("nvim-ts-autotag").setup()

-- mini files ----
local MiniFiles = require("mini.files")
MiniFiles.setup({
    mappings = {
        go_in_plus = "l",
        go_out_plus = "h",
        synchronize = "<Cr>",
    },
})

vim.keymap.set("n", "<leader><Space>", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

vim.keymap.set("n", "<Cr>", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

---- mini notify ----
require("mini.notify").setup({
	-- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

--- mini cmdline completion ---
require("mini.cmdline").setup({
    autocorrect = { enable = false }
})

--- mini picker ---
local MiniPick = require("mini.pick")
MiniPick.setup({
  mappings = {
    move_down = '<M-j>', -- Alt + j
    move_up   = '<M-k>', -- Alt + k
  }
})

--- mini completions --- 
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})

--- mini tabline (Bufferline) ---
require('mini.tabline').setup({
    -- Show a visual indicator of hidden buffers
    show_icons = true,
})

--- mini jump2d ---
require("mini.jump2d").setup({
    mappings = {
        start_jumping = '',
    },
})
