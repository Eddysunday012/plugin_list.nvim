vim.api.nvim_create_user_command("PluginList", function()
	-- Easily reload the module to reflect any changes
	package.loaded["plugin_list"] = nil
	require("plugin_list").setup()
end, {})
