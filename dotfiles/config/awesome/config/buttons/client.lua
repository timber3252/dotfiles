local gears = require("gears")
local awful = require("awful")

local modKey = require('config.keys.mod').ModKey

return gears.table.join(
  awful.button(
    { },
    1,
    function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
    end
  ),
  awful.button(
    { modKey },
    1,
    function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.move(c)
    end
  ),
  awful.button(
    { modKey },
    3,
    function (c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.resize(c)
    end
  )
)