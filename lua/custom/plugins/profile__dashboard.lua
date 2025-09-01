local comp = require("profile.components")
require("profile").setup({
	avatar_opts = {
		avatar_width = 0,
		avatar_height = 0,
		avatar_x = 0,
		avatar_y = 0,
		force_blank = true;
	},
	hide = {
		statusline = true,
		tabline = true,
	},
	disable_keys = {},    -- disable some mappings. (You can use it to disable cursor movement)
	cursor_pos = { 14, 192 }, -- set cursor position
	format = function()
		local header = {
			[[                                                                                                    ]],
			[[                                                                                                    ]],
			[[                                                                                                    ]],
			[[╭──────────────────────────────────────────────────────────────────────────────────────────────────╮]],
			[[│                                                ORIONID                                           │]],
			[[╰──────────────────────────────────────────────────────────────────────────────────────────────────╯]],
		}
		local info = {
			[[╭────────────────────────────────────────────────────╮ ╭───────────────────╮╭──────────────────────╮]],
			[[│                                                    │ │ OrionShinesBright││ Neovim : v0.12.0-dev│]],
			[[│ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣤⡼⠀⢀⡀⣀⢱⡄⡀⠀⠀⠀⢲⣤⣤⣤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ │ ╰───────────────────╯╰──────────────────────╯]],
			[[│ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⡿⠛⠋⠁⣤⣿⣿⣿⣧⣷⠀⠀⠘⠉⠛⢻⣷⣿⣽⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀ │ ╭───────────────────────────────────────────╮]],
			[[│ ⠀⠀⠀⠀⠀⠀⢀⣴⣞⣽⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠠⣿⣿⡟⢻⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣟⢦⡀⠀⠀⠀⠀⠀⠀ │ │󰌹 LINKS                                    │]],
			[[│ ⠀⠀⠀⠀⠀⣠⣿⡾⣿⣿⣿⣿⣿⠿⣻⣿⣿⡀⠀⠀⠀⢻⣿⣷⡀⠻⣧⣿⠆⠀⠀⠀⠀⣿⣿⣿⡻⣿⣿⣿⣿⣿⠿⣽⣦⡀⠀⠀⠀⠀ │ │ + 󰴕 https://orionids.neocities.org        │]],
			[[│ ⠀⠀⠀⠀⣼⠟⣩⣾⣿⣿⣿⢟⣵⣾⣿⣿⣿⣧⠀⠀⠀⠈⠿⣿⣿⣷⣈⠁⠀⠀⠀⠀⣰⣿⣿⣿⣿⣮⣟⢯⣿⣿⣷⣬⡻⣷⡄⠀⠀⠀ │ │ +  https://github.com/OrionShinesBright  │]],
			[[│ ⠀⠀⢀⡜⣡⣾⣿⢿⣿⣿⣿⣿⣿⢟⣵⣿⣿⣿⣷⣄⠀⣰⣿⣿⣿⣿⣿⣷⣄⠀⢀⣼⣿⣿⣿⣷⡹⣿⣿⣿⣿⣿⣿⢿⣿⣮⡳⡄⠀⠀ │ │ + 󰮠 https://gitlab.com/orionshinesbright88│]],
			[[│ ⠀⢠⢟⣿⡿⠋⣠⣾⢿⣿⣿⠟⢃⣾⢟⣿⢿⣿⣿⣿⣾⡿⠟⠻⣿⣻⣿⣏⠻⣿⣾⣿⣿⣿⣿⡛⣿⡌⠻⣿⣿⡿⣿⣦⡙⢿⣿⡝⣆⠀ │ │ + 󰶎 orionshinesbright88@gmail.com         │]],
			[[│ ⠀⢯⣿⠏⣠⠞⠋⠀⣠⡿⠋⢀⣿⠁⢸⡏⣿⠿⣿⣿⠃⢠⣴⣾⣿⣿⣿⡟⠀⠘⢹⣿⠟⣿⣾⣷⠈⣿⡄⠘⢿⣦⠀⠈⠻⣆⠙⣿⣜⠆ │ ╰───────────────────────────────────────────╯]],
			[[│ ⢀⣿⠃⡴⠃⢀⡠⠞⠋⠀⠀⠼⠋⠀⠸⡇⠻⠀⠈⠃⠀⣧⢋⣼⣿⣿⣿⣷⣆⠀⠈⠁⠀⠟⠁⡟⠀⠈⠻⠀⠀⠉⠳⢦⡀⠈⢣⠈⢿⡄ │ ╭───────────────────────────────────────────╮]],
			[[│ ⣸⠇⢠⣷⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⠿⠋⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢾⣆⠈⣷ │ │ Ongoing Projects                         │]],
			[[│ ⡟⠀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣤⡀⢸⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⢹ │ │ +  ~/Projects/SysUtils/osh               │]],
			[[│ ⡇⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠈⣿⣼⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⢸ │ │ + 󱤙 ~/Projects/Games/One-Day              │]],
			[[│ ⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠶⣶⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼ │ │ +  ~/Projects/Docs/Linux-Roadmap         │]],
			[[│ ⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁ │ │ +  ~/Projects/Programming/DataStructures │]],
			[[│ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡁⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ │ ╰───────────────────────────────────────────╯]],
			[[│ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣼⣀⣠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ │ ╭───────────────────────────────────────────╮]],
			[[│                                                    │ │   https://gitlab.com/newvim/Full-Config  │]],
			[[╰────────────────────────────────────────────────────╯ ╰───────────────────────────────────────────╯]],
		}
		local quote = {
			[[╭──────────────────────────────────────────────────────────────────────────────────────────────────╮]],
			[[│                         Anything can happen, child.. Anything can be                             │]],
			[[╰──────────────────────────────────────────────────────────────────────────────────────────────────╯]],
		}

		for _, line in ipairs(header) do
			comp:text_component_render({ comp:text_component(line, "center", "ProfileBlue") })
		end
		for _, line in ipairs(info) do
			comp:text_component_render({ comp:text_component(line, "center", "ProfileRed") })
		end
		for _, line in ipairs(quote) do
			comp:text_component_render({ comp:text_component(line, "center", "ProfileBlue") })
		end
	end,
})
local user_mappings = {
	n = {
		["e"] = "<cmd>Drex .<cr>",
		["p"] = "<cmd>Drex $HOME/Projects/<cr><cmd>cd $HOME/Projects/<cr>",
		["f"] = "<cmd>Pick files<cr>",
		["h"] = "<cmd>Pick help<cr>",
		["c"] = "<cmd>Drex $HOME/.config/nvim<cr><cmd>cd $HOME/.config/nvim<cr>",
		["/"] = "<cmd>Pick grep_live<cr>",
		["n"] = "<cmd>enew<cr>",
		["l"] = "<cmd>checkhealth<cr>",
		["q"] = "<cmd>quit<cr>",
		["o"] = "<cmd>restart<cr>",
	},
}
vim.api.nvim_create_autocmd("FileType", {
	pattern = "profile",
	callback = function()
		for mode, mapping in pairs(user_mappings) do
			for key, cmd in pairs(mapping) do
				vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true, silent = true })
			end
		end
	end,
})
