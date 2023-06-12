return {
    "rcarriga/nvim-dap-ui",
    config = function(plugin, opts)
        local dapui = require "dapui"
        dapui.setup({
            layouts = { {
                elements = { 
                    {
                        id = "scopes",
                        size = 0.25
                    },
                    {
                        id = "breakpoints",
                        size = 0.25
                    },
                    {
                        id = "stacks",
                        size = 0.25
                    },
                    {
                        id = "watches",
                        size = 0.25
                    }
                },
                position = "left",
                size = 40
            }, {
                    elements = { 
                        {
                            id = "repl",
                            size = 1
                        }, 
                        -- {
                        --     id = "console",
                        --     size = 0.5
                        -- } 
                    },
                    position = "bottom",
                    size = 13 
            } },
        })
    end
}
