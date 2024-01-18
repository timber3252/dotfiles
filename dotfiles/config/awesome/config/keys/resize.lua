local gears = require("gears")
local awful = require("awful")
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
    {},
    "h",
    function (c)
      require('awsl.util.resize-client')(client.focus, "left")
    end,
    { description = "resize towards left", group = "RESIZE" }
  ),
  awful.key(
    {},
    "j",
    function (c)
      require('awsl.util.resize-client')(client.focus, "down")
    end,
    { description = "resize towards down", group = "RESIZE" }
  ),
  awful.key(
    {},
    "k",
    function (c)
      require('awsl.util.resize-client')(client.focus, "up")
    end,
    { description = "resize towards up", group = "RESIZE" }
  ),
  awful.key(
    {},
    "l",
    function (c)
      require('awsl.util.resize-client')(client.focus, "right")
    end,
    { description = "resize towards right", group = "RESIZE" }
  )
)