local helpers = require('awsl.helpers')
local gears = require("gears")
local awful = require("awful")
local apps = require('config.apps')

local modKey = require('config.keys.mod').ModKey

return gears.table.join(
  awful.key(
    {},
    "Escape",
    function ()
      mode.setMode('normal')
    end
  ),
  awful.key(
    { modKey },
    "Escape",
    function ()
      mode.setMode('normal')
    end
  ),
  awful.key(
    { modKey },
    "1",
    function ()
      awful.spawn(apps.Default.VolumnManager)
      mode.setMode('normal')
    end,
    { description = "open default volumn manager", group = "SETTINGS (manager)" }
  ),
  awful.key(
    { modKey },
    "2",
    function ()
      awful.spawn(apps.Default.InputMethodManager)
      mode.setMode('normal')
    end,
    { description = "open default input method manager", group = "SETTINGS (manager)" }
  ),
  awful.key(
    { modKey },
    "3",
    function ()
      awful.spawn(apps.Default.NetworkManager)
      mode.setMode('normal')
    end,
    { description = "open default network manager", group = "SETTINGS (manager)" }
  ),
  awful.key(
    { modKey },
    "4",
    function ()
      awful.spawn(apps.Default.ProxyManager)
      mode.setMode('normal')
    end,
    { description = "open default proxy manager", group = "SETTINGS (manager)" }
  ),
  awful.key(
    {},
    "g",
    function ()
      helpers.spawn.exec("brightnessctl s 10%-")
    end,
    { description = "brightnessctl - lower brightness", group = "SETTINGS (helper)" }
  ),
  awful.key(
    {},
    "h",
    function ()
      helpers.spawn.exec("brightnessctl s +10%")
    end,
    { description = "brightnessctl - raise brightness", group = "SETTINGS (helper)" }
  ),
  awful.key(
    {},
    "j",
    function ()
      helpers.spawn.exec("pulsemixer --change-volume -5")
    end,
    { description = "pulsemixer - audio lower volume", group = "SETTINGS (helper)" }
  ),
  awful.key(
    {},
    "k",
    function ()
      helpers.spawn.exec("pulsemixer --change-volume +5")
    end,
    { description = "pulsemixer - audio raise volume", group = "SETTINGS (helper)" }
  ),
  awful.key(
    {},
    "l",
    function ()
      helpers.spawn.exec("pulsemixer --toggle-mute")
    end,
    { description = "pulsemixer - toggle audio mute", group = "SETTINGS (helper)" }
  ),
  awful.key(
    {},
    "p",
    function ()
      playerctl.togglePlayStatus(true)
      -- mode.setMode('normal')
    end,
    { description = "playerctl - toggle play status", group = "SETTINGS (helper)"}
  ),
  awful.key(
    {},
    "o",
    function ()
      playerctl.toggleLyricsMode()
      -- mode.setMode('normal')
    end,
    { description = "playerctl - toggle lyrics mode", group = "SETTINGS (helper)"}
  ),
  awful.key(
    {},
    "[",
    function ()
      playerctl.prevTrack(true)
      -- mode.setMode('normal')
    end,
    { description = "playerctl - previous track", group = "SETTINGS (helper)"}
  ),
  awful.key(
    {},
    "]",
    function ()
      playerctl.nextTrack(true)
      -- mode.setMode('normal')
    end,
    { description = "playerctl - next track", group = "SETTINGS (helper)"}
  )
)
