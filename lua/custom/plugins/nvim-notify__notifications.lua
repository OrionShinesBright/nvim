local notify = require("notify")
notify.setup({
	render = "compact",
	stages = "static",
	timeout = 2000,
	minimum_width = 25,
	max_width = function()
		return math.floor(vim.o.columns * 0.35)
	end,
	merge_duplicates = true,
	background_colour = "#1e1e2e", -- Or use highlight group
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = "",
	},
	fps = 10,
	top_down = true,
	time_formats = {
		notification = "%T",
		notification_history = "%FT%T",
	},
})

vim.notify = notify

-- Override LSP messages
vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
	local client = vim.lsp.get_client_by_id(ctx.client_id)
	local level = ({
		"ERROR",
		"WARN",
		"INFO",
		"DEBUG"
	})[result.type] or "INFO"

	notify(result.message, level, {
		title = "LSP | " .. client.name,
		timeout = 5000,
		keep = function()
			return level == "ERROR" or level == "WARN"
		end
	})
end

-- Attach/detach autocommands
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			notify("LSP Attached: " .. client.name, "INFO", { title = "LSP" })
		end
	end
})

vim.api.nvim_create_autocmd("LspDetach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			notify("LSP Detached: " .. client.name, "WARN", { title = "LSP" })
		end
	end
})

local workspace_tokens = {}
local halfway_notified = {}
local quarter_notified = {}
local svnfve_notified = {}

vim.lsp.handlers["$/progress"] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then return end

  local val = result.value
  local token = result.token

  -- Handle 'begin'
  if val.kind == "begin" and val.title == "Loading workspace" then
    workspace_tokens[token] = true
    halfway_notified[token] = false
    quarter_notified[token] = false
    svnfve_notified[token]  = false
    return
  end

  -- Handle 'report' — check for ~50% progress
  if val.kind == "report" and workspace_tokens[token] then
    local percent = val.percentage or 0
    if percent >= 25 and not quarter_notified[token] then
      notify("LSP 25% loaded..", "info", {
        title = "LSP • " .. client.name,
        timeout = 500,
      })
      quarter_notified[token] = true
    end
    if percent >= 50 and not halfway_notified[token] then
      notify("Halfway there.. 🔄", "info", {
        title = "LSP • " .. client.name,
        timeout = 1000,
      })
      halfway_notified[token] = true
    end
    if percent >= 75 and not svnfve_notified[token] then
      notify("75% there..", "info", {
        title = "LSP • " .. client.name,
        timeout = 500,
      })
      svnfve_notified[token] = true
    end
    return
  end

  -- Handle 'end'
  if val.kind == "end" and workspace_tokens[token] then
    notify("Workspace loaded ✅", "info", {
      title = "LSP • " .. client.name,
      timeout = 3000,
    })
    workspace_tokens[token] = nil
    halfway_notified[token] = nil
    return
  end
end
