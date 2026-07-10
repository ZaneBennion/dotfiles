return {
    lua = {
        ts = "lua",
        lsp = "lua_ls",
        mason = "lua-language-server",
        settings = { Lua = { diagnostics = { globals = { "vim" } } } }
    },
    rust = {
        ts = "rust",
        lsp = "rust_analyzer",
        mason = "rust-analyzer"
    },
    typescript = {
        -- Some languages need multiple Treesitter parsers
        ts = { "typescript", "javascript", "tsx" }, 
        lsp = "ts_ls",
        mason = "typescript-language-server"
    },
    html = {
        ts = "html",
        lsp = "html",
        mason = "html-lsp"
    },
    tailwind = {
        ts = "css",
        lsp = "tailwindcss",
        mason = "tailwindcss-language-server"
    },
    markdown = {
        ts = "markdown",
        lsp = "marksman",
        mason = "marksman"
    },
    -- Languages where you only want Treesitter formatting, no LSP
    bash = { ts = "bash" },
    json = { ts = "json" },
    docker = { ts = "dockerfile" },
    http = { ts = "http" },
}
