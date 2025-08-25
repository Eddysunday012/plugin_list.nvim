local M = {}

M.setup = function()
	local plugins = require("lazy.core.config").plugins

	if not plugins or next(plugins) == nil then
		vim.notify("No plugins found or lazy.nvim not initialized.", vim.log.levels.WARN)
		return
	end

	local lines = { " --- Lazy Plugins ---" }
	for plugin_name, _ in pairs(plugins) do
		table.insert(lines, plugin_name)
	end
	table.insert(lines, "--------------------")

	-- Create a scratch buffer
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	-- Calculate window size
	local width = 0
	for _, line in ipairs(lines) do
		width = math.max(width, #line)
	end
	local height = #lines

	-- Open floating window
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width + 20,
		height = height + 2,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	})
end

M.setup()

return M
