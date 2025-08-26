vim.api.nvim_create_user_command("PluginList", function()
	require("plugin_list").openWindow()
end, {})
