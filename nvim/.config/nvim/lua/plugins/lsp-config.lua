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
                    "vue_ls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- Capabilities (same as before)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            ---------------------------------------------------------------------
            -- 1. Global LSP Keymaps via LspAttach
            ---------------------------------------------------------------------
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })

            ---------------------------------------------------------------------
            -- 2. All servers you want enabled (basic defaults)
            ---------------------------------------------------------------------
            local servers = {
                "lua_ls",
                "html",
                "htmx",
                "cssls",
                "cssmodules_ls",
                "css_variables",
                "tailwindcss",
                "ts_ls",
                "biome",
                "phpactor",
                "clangd",
                "gopls",
                "eslint",
                "vue_ls",
                "rust_analyzer",
                "intelephense",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(server)
            end

            ---------------------------------------------------------------------
            -- 3. Advanced: gopls override
            ---------------------------------------------------------------------
            vim.lsp.config("gopls", {
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                            unreachable = true,
                        },
                    },
                },
            })

            ---------------------------------------------------------------------
            -- 4. Lua LS recommended settings (Neovim environment)
            ---------------------------------------------------------------------
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            ---------------------------------------------------------------------
            -- 5. Volar: updated Vue 3 config
            ---------------------------------------------------------------------
            vim.lsp.config("vue_ls", {
                capabilities = capabilities,
                filetypes = { "vue", "javascript", "typescript" },
                init_options = {
                    vue = { hybridMode = false },
                },
            })

            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        inlayHints = {
                            enable = true,
                            typeHints = true,
                            parameterHints = true,
                            chainingHints = true,
                        },
                    },
                },
            })
            vim.lsp.enable("rust_analyzer")
        end,
    }
}
