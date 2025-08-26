vim.api.nvim_create_user_command("PluginList", function()
	-- easily reload the plugin in case of changes
	package.loaded["plugin_list"] = nil
	require("plugin_list").openWindow()
end, {})
