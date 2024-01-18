--
--   __ ___      _____  ___  ___  _ __ ___   ___
--  / _` \ \ /\ / / _ \/ __|/ _ \| '_ ` _ \ / _ \
-- | (_| |\ V  V /  __/\__ \ (_) | | | | | |  __/
--  \__,_| \_/\_/ \___||___/\___/|_| |_| |_|\___|
--
--

pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require('wibox')
local beautiful = require("beautiful")
local helpers = require('awsl.helpers')

---{{{ awesome basic configurations

if awesome.startup_errors then
  helpers.log.error(awesome.startup_errors, "Oops, there were errors during startup!")
end
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    if in_error then return end
    in_error = true
    helpers.log.error(tostring(err), "Oops, an error happened!")
    in_error = false
  end)
end

awful.layout.layouts = require('config.layout')

awful.util.shell = 'bash'

require('awful.autofocus')

beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
require('theme.rs')(beautiful)
beautiful.get().wallpaper = require('config.theme').Wallpaper
gears.wallpaper.maximized(beautiful.wallpaper, nil, true)

require('config.client.rules')
require('config.client.signals')

---}}}

---{{{ awsl configurations

require('awsl.util.autostart')({
  apps = require('config.apps.auto-start')
})

playerctl = require('awsl.widget.playerctl')({
  trackedPlayerList = {
    "ElectronNCM",
    "rhythmbox",
  },
  lyricsMode = false,
  timeout = 1
})

mode = require('awsl.widget.mode')({
  modes = {
    normal = {
      text = 'NORMAL',
      keys = require('config.keys.normal'),
    },
    open = {
      text = 'LAUNCH',
      keys = require('config.keys.open'),
    },
    settings = {
      text = 'CONFIG',
      keys = require('config.keys.settings'),
      hint = '1: Vol, 2: IM, 3: Net, 4: Proxy',
    },
    resize = {
      text = 'RESIZE',
      keys = require('config.keys.resize'),
    }
  },
  defaultMode = 'normal',
  globalKeys = require('config.keys.global'),
})

battery = require('awsl.widget.battery')({
  hiddenWhileCharging = true,
  lowPowerWarningColor = beautiful.system_red_light,
  lowPowerThreshold = 20,
})

mem = require('awsl.widget.mem')()
cpu = require('awsl.widget.cpu')()

---}}}

---{{{ user interface & theme configurations

require('layout')

---}}}

-- require("lgi").GLib.MainLoop():run()
