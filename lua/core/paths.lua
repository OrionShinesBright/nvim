local uv = vim.loop

local M = {}

local rtp = os.getenv("VIMRUNTIME") or "$VIMRUNTIME"
local nvimdir = "/home/system/.config/nvim/"
local customdir = nvimdir .. "lua/custom/"
local lazydir = customdir .. "lazy/"

local plugin_paths = {
	nvimdir .. "pack/fun/opt/",
	nvimdir .. "pack/fun/start/",
	nvimdir .. "pack/imp/opt/",
	nvimdir .. "pack/imp/start/",
	nvimdir .. "pack/mine/opt/",
	nvimdir .. "pack/mine/start/",
}

local config_dirs = {
	nvimdir, nvimdir .. "after/", nvimdir .. "lsp/", nvimdir .. "lua/",
	customdir, customdir .. "plugins/", customdir .. "settings/", lazydir,
	rtp, rtp .. "/pack/dist/opt/matchit",
	rtp .. "/../../../lib/nvim/", "/usr/share/vim/vimfiles"
}

local function get_subdirs(path)
	local dirs = {}
	local handle = uv.fs_scandir(path)
	if not handle then return dirs end
	while true do
		local name, type = uv.fs_scandir_next(handle)
		if not name then break end
		if type == "directory" then
			table.insert(dirs, path .. name)
		end
	end
	return dirs
end

function M.setup()
	for _, path in ipairs(plugin_paths) do
		vim.list_extend(config_dirs, get_subdirs(path))
	end
	vim.o.runtimepath = table.concat(config_dirs, ",")
	vim.opt.packpath = { nvimdir .. "pack/" }
	vim.opt.path = {
		".", -- current dir
		"doc", -- documentation
		"include", -- headers (C/C++ etc)
		"lib", -- libraries
		"man", -- manpages
		"help", -- help files
		"**", -- all subdirs recursively
		"src", -- source files (common)
		"tests", -- test files
		"assets", -- images, static files (if relevant)
		"scripts", -- shell/python scripts maybe
		"public", -- for web dev
	}
	local root = vim.fn.getcwd()
	vim.opt.path:append(root .. "/src")
end

return M
