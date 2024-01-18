local gears = require("gears")
local awful = require("awful")

local modKey = require('config.keys.mod').ModKey

return gears.table.join(
  awful.key(
    { modKey },
    "f",
    function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "GLOBAL (client)" }
  ),
  awful.key(
    { modKey, 'Shift' },
    "q",
    function (c)
      c:kill()
    end,
    { description = "close", group = "GLOBAL (client)" }
  ),
  awful.key(
    { modKey },
    "c",
    function (c)
      require('awsl.util.magnify-client')(c, 0.75)
    end,
    { description = "toggle magnify", group = "GLOBAL (client)" }
  ),
  awful.key(
    { modKey },
    "t",
    function (c)
      c.ontop = not c.ontop
    end,
    { description = "toggle keep on top", group = "GLOBAL (client)" }
  ),
  awful.key(
    { modKey },
   "n",
    function (c)
      c.minimized = true
    end,
    { description = "minimize", group = "GLOBAL (client)" }
  ),
  awful.key(
    { modKey },
    "m",
    function (c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "toggle maximize", group = "GLOBAL (client)" }
  )
)