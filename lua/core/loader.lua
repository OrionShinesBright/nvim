local uv = vim.loop

local excluded_dirs = {
    snippets = true,
    lazy = true
}

local M = {}

local function scan_modules(base_path, require_prefix)
    local modules = {}

    local function scan(current, relative)
        local handle = uv.fs_scandir(current)
        if not handle then return end

        while true do
            local name, type = uv.fs_scandir_next(handle)
            if not name then break end

            local full = current .. "/" .. name
            local rel = relative ~= "" and (relative .. "/" .. name) or name

            if type == "file" and name:sub(-4) == ".lua" then
                local mod = rel:sub(1, -5):gsub("/", ".")
                table.insert(modules, require_prefix .. mod)
            elseif type == "directory" and not excluded_dirs[name] then
                scan(full, rel)
            end
        end
    end

    scan(base_path, "")
    return modules
end

local function watch_and_reload(mod)
    local file = vim.fn.stdpath("config") .. "/lua/" .. mod:gsub("%.", "/") .. ".lua"

    uv.fs_stat(file, function(stat)
        if stat then
            local handle
            handle = uv.new_fs_poll()
            handle:start(file, 1000, function()
                package.loaded[mod] = nil
                local ok, err = pcall(require, mod)
                if not ok then
                    vim.schedule(function()
                        vim.notify("Reload failed: " .. mod .. "\n" .. err, vim.log.levels.ERROR)
                    end)
                else
                    vim.schedule(function()
                        vim.notify("Reloaded: " .. mod, vim.log.levels.INFO)
                    end)
                end
            end)
        end
    end)
end

function M.load_all()
    local base = vim.fn.stdpath("config") .. "/lua/custom/"
    local modules = {}
    vim.list_extend(modules, scan_modules(base, "custom."))
    vim.list_extend(modules, scan_modules(base .. "plugins", "custom.plugins."))
    vim.list_extend(modules, scan_modules(base .. "settings", "custom.settings."))

    for _, mod in ipairs(modules) do
        local ok, err = pcall(require, mod)
        if not ok then
            vim.notify("Error loading: " .. mod .. "\n" .. err, vim.log.levels.ERROR)
        else
            watch_and_reload(mod)
        end
    end
end

return M
