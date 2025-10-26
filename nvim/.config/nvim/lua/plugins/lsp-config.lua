return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "htmx",
                    "cssmodules_ls",
                    "css_variables",
                    "cssls",
                    "tailwindcss",
                    "ts_ls",
                    "biome",
                    "rust_analyzer",
                    "phpactor",
                    "clangd",
                    "gopls",
                    "somesass_ls",
                    "eslint",
                    "intelephense",
                    "volar",
                    "vuels",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig/util")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {
                "lua_ls",
                "html",
                "htmx",
                "cssmodules_ls",
                "css_variables",
                "cssls",
                "tailwindcss",
                "ts_ls",
                "biome",
                "rust_analyzer",
                "phpactor",
                "clangd",
                "gopls",
                "somesass_ls",
                "eslint",
                "volar",
                "vuels",
            }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end

            -- gopls
            lspconfig.gopls.setup({
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Buffer Hover" })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Buffer Definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show Code Action" })
        end,
    },
}
