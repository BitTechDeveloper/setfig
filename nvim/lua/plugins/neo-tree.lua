return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            bind_to_cwd = false, -- Prevent Neo-tree from changing CWD unless specified
            commands = {}, -- Preserve default commands
        },
    },
    keys = {
        -- Keybinding for <leader>e: Open Neo-tree in CWD
        {
            "<leader>e",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
            end,
            desc = "Explorer NeoTree (cwd)",
        },
        -- Keybinding for <leader>E: Open Neo-tree in project root
        {
            "<leader>E",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util.root").get() })
            end,
            desc = "Explorer NeoTree (root dir)",
        },
    },
}
