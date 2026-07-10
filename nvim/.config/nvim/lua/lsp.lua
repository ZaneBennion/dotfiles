require("mason").setup()
local langs = require("languages")

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())
vim.lsp.config("*", { capabilities = capabilities })

-- Dynamically build LSP lists
local lsp_enable_list = {}
local mason_install_list = {}

for _, config in pairs(langs) do
    if config.lsp then
        table.insert(lsp_enable_list, config.lsp)
        -- Apply specific settings if defined in languages.lua
        if config.settings then
            vim.lsp.config(config.lsp, { settings = config.settings })
        end
    end
    if config.mason then
        table.insert(mason_install_list, config.mason)
    end
end

-- Auto-Download missing LSPs via Mason Registry API
local registry = require("mason-registry")
registry.refresh(function()
    for _, pkg_name in ipairs(mason_install_list) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok and not pkg:is_installed() then
            pkg:install()
        end
    end
end)

-- Enable all mapped LSPs
vim.lsp.enable(lsp_enable_list)
