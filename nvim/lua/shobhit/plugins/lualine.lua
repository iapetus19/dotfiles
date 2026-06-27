return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- Function to format file size in KB/MB
		local function format_filesize()
			local file = vim.fn.expand("%:p") -- Get file path
			local size = vim.fn.getfsize(file) -- Get file size in bytes
			if size < 0 then
				return ""
			end -- If size is -1 (invalid), return empty string
			if size < 1024 then
				return size .. " B"
			elseif size < 1024 * 1024 then
				return string.format("%.1f KB", size / 1024)
			else
				return string.format("%.1f MB", size / (1024 * 1024))
			end
		end

		-- Cache for music info to reduce lag
		local last_music_update = 0
		local cached_music = ""

		-- Function to get currently playing music on macOS (Apple Music/Spotify)
		local function get_music()
			local current_time = os.time()
			if current_time - last_music_update < 5 then
				return cached_music -- Use cached result if <5 seconds since last update
			end

			local spotify_cmd =
				[[osascript -e 'tell application "Spotify" to if player state is playing then artist of current track & " - " & name of current track' 2>/dev/null]]

			local handle = io.popen(spotify_cmd)
			local result = handle:read("*a")
			handle:close()

			result = result:gsub("\n", "") -- Remove newlines
			cached_music = result ~= "" and "󰎆 " .. result or "" -- Cache result
			last_music_update = current_time -- Update cache time

			return cached_music
		end

		-- Function to display filename + music together
		local function file_and_music()
			local filename = vim.fn.expand("%:t") -- Get filename
			local music = get_music()
			if music ~= "" then
				return filename .. " | " .. music
			else
				return filename
			end
		end

		local nvimbattery = {
			function()
				return require("battery").get_status_line()
			end,
		}

		-- Configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
			},
			globalstatus = false,
			sections = {
				lualine_a = nvimbattery,
				lualine_b = { format_filesize }, -- Use formatted file size function
				lualine_c = { file_and_music }, -- Show filename and music together
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
						function()
							local enabled = require("pigeon.config").options.battery.enabled
							local battery = require("pigeon.battery").battery()

							if enabled then
								return battery
							else
								return ""
							end
						end,
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})

		lualine.extensions = { "fzf", "lazy", "mason", "nvim-tree", "toggleterm" }
	end,
}
