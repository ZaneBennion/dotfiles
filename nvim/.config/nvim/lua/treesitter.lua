local treesitter = require("nvim-treesitter")
local langs = require("languages")

-- Dynamically build the ensure_installed list
local ensure_installed = {}
for _, config in pairs(langs) do
    if type(config.ts) == "string" then
        table.insert(ensure_installed, config.ts)
    elseif type(config.ts) == "table" then
        for _, ts_name in ipairs(config.ts) do
            table.insert(ensure_installed, ts_name)
        end
    end
end

treesitter.install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype

        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then return end

        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then return end

        pcall(vim.treesitter.start, buf, lang)
    end,
})
