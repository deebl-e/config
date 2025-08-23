

-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font =
  wezterm.font('JetBrains Mono', { weight = 'DemiBold'})

config.color_scheme = 'rose-pine'

config.colors = {
    --fix the highlight not appearing in the rose-pine theme
    selection_bg = '#403d52',
}

--config for the tab bar
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config,
	{
		position = "top"
	}
)

config.window_decorations = "RESIZE"


-- Finally, return the configuration to wezterm:
return config
