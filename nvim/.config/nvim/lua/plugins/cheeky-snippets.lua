return {
    "madskjeldgaard/cheeky-snippets.nvim",
    config = function()
        local cheeky = require("cheeky")
        cheeky.setup({
            langs = {
                all = true,
                lua = true,
                cpp = true,
                asm = true,
                cmake = true,
                markdown = true,
                supercollider = true,
            },
        })
    end,
}
