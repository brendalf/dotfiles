local impatient = require("impatient")
local plugins = require("plugins")
local colors = require("colors")
local plugin_loader = require("plugin-loader")
local core = require("core")
local keymappings = require("keymappings")
local config = require("config")

function init()
    config.init()
    keymappings.init()

    plugin_loader.init()
    plugin_loader.load(plugins)

    if plugin_loader.packer_is_first_start then
        return
    end

    colors.init()
    core.init()
end

init()
