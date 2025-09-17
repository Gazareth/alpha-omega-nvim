---@class CustomModule
local M = {}

---@return string
M.setup = function(opts)
    local ucmd = vim.api.nvim_create_user_command

    local present, alpha = pcall(require, "alpha")

    local dashboard = require("alpha.themes.dashboard")
    if not present then
        return print("[`alpha-omega-nvim`]:- dependency `alpha-nvim` not found!")
    end

    local default_opts = {
        dashboards = {
            default = function()
                return dashboard
            end
        },
        default_dashboard = "default"
    }

    -- Extract config
    local dashboards = opts.dashboards or default_opts.dashboards
    local dashboard_history = {opts.default_dashboard or default_opts.default_dashboard}

    -- The magic
    local function switch_dashboard(new_dashboard_name)
        if (vim.o.filetype == "alpha") then
            vim.cmd("bd!")
        end
        local new_dashboard = dashboards[new_dashboard_name] or dashboards["base"]
        alpha.setup(new_dashboard(vim.deepcopy(dashboard)).config)
        table.insert(dashboard_history, 1, new_dashboard_name)
        vim.cmd("Alpha")
    end

    -- Main command
    ucmd("AlphaOmega", function(args)
        if (vim.o.filetype == "alpha") then
            vim.cmd("bd!")
        end
        local dash_key_to_switch_to = args.args ~= "" and args.args or dashboard_history[1]
        local trimmed_key_to_switch_to = dash_key_to_switch_to:match("^%s*(.-)%s*$");
        switch_dashboard(trimmed_key_to_switch_to)
    end, {
        desc = "Opens an Alpha dashboard by key",
        nargs = "?"
    })

    -- "Go back" command; supposed to behave like a browser back button
    ucmd("AlphaOmegaPrev", function()
        if (vim.o.filetype == "alpha") then
            table.remove(dashboard_history, 1)
            previous_dashboard = dashboard_history[1]
            if previous_dashboard then
                switch_dashboard(previous_dashboard)
            else
                print("No previous dashboard to switch to!")
            end
        else
            local previous_dashboard = dashboard_history[1]
            switch_dashboard(previous_dashboard)
        end
    end, {
        desc = "Opens the previous Alpha dashboard",
        nargs = 0
    })

    local starter_dashboard = dashboards[dashboard_history[1]](dashboard)
    alpha.setup(starter_dashboard.config)
end

return M
