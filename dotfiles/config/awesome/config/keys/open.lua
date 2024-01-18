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
    "w",
    function ()
      awful.spawn(apps.Default.WebBrowser)
      mode.setMode('normal')
    end,
    { description = "open default browser", group = "OPEN" }
  ),
  awful.key(
    { modKey },
    "m",
    function ()
      awful.spawn(apps.Default.MusicPlayer)
      mode.setMode('normal')
    end,
    { description = "open default music player", group = "OPEN" }
  ),
  awful.key(
    { modKey },
    "e",
    function ()
      awful.spawn(apps.Default.TextEditor)
      mode.setMode('normal')
    end,
    { description = "open default text editor", group = "OPEN" }
  ),
  awful.key(
    { modKey },
    "f",
    function ()
      awful.spawn(apps.Default.FileManager)
      mode.setMode('normal')
    end,
    { description = "open default file manager", group = "OPEN" }
  ),
  awful.key(
    { modKey },
    "i",
    function ()
      awful.spawn(apps.Default.InstantMessager)
      mode.setMode('normal')
    end,
    { description = "open default instant messager", group = "OPEN" }
  ),
  awful.key(
    { modKey },
    "Return",
    function ()
      awful.spawn(apps.Default.Terminal)
      mode.setMode('normal')
    end,
    { description = "open default terminal", group = "OPEN" }
  )
)
