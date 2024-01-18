local helpers = require('awsl.helpers')
local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require('awful.hotkeys_popup').widget
local modKey = require('config.keys.mod').ModKey

return gears.table.join(
  awful.key(
    { modKey },
    "F1",
    hotkeys_popup.show_help,
    { description="show help", group="GLOBAL" }
  ),
  awful.key(
    { modKey, 'Control' },
    "r",
    awesome.restart,
    { description = "reload awesome", group = "GLOBAL" }
  ),
  awful.key(
    { modKey, 'Control' },
    "e",
    awesome.quit,
    { description = "exit awesome", group = "GLOBAL" }
  ),
  awful.key(
    {},
    "XF86MonBrightnessDown",
    function ()
      helpers.spawn.exec("brightnessctl s 10%-")
    end
  ),
  awful.key(
    {},
    "XF86MonBrightnessUp",
    function ()
      helpers.spawn.exec("brightnessctl s +10%")
    end
  ),
  awful.key(
    {},
    "XF86AudioLowerVolume",
    function ()
      helpers.spawn.exec("pulsemixer --change-volume -5")
    end
  ),
  awful.key(
    {},
    "XF86AudioRaiseVolume",
    function ()
      helpers.spawn.exec("pulsemixer --change-volume +5")
    end
  ),
  awful.key(
    {},
    "XF86AudioMute",
    function ()
      helpers.spawn.exec("pulsemixer --toggle-mute")
    end
  ),
  awful.key(
    { modKey, 'Shift' },
    "n",
    function ()
      local c = client.restore(nil)
      if c then
        client.focus = c
        c:raise()
      end
    end,
    { description = "restore minimize", group = "GLOBAL (client)" }
  )
)
