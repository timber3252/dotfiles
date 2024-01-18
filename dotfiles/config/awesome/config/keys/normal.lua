local helpers = require('awsl.helpers')
local gears = require("gears")
local awful = require("awful")

local modKey = require('config.keys.mod').ModKey
local altKey = require('config.keys.mod').AltKey
local apps = require('config.apps')

local normalKeys = gears.table.join(
  awful.key(
    { modKey },
    "[",
    awful.tag.viewprev,
    { description = "view previous", group = "NORMAL (tag)" }
  ),
  awful.key(
    { modKey },
    "]",
    awful.tag.viewnext,
    { description = "view next", group = "NORMAL (tag)" }
  ),
  awful.key(
    { modKey },
    "Escape",
    awful.tag.history.restore,
    { description = "go back", group = "NORMAL (tag)" }
  ),
  awful.key(
    {},
    "Print",
    function ()
      awful.spawn("flameshot full -c")
    end,
    { description = "screenshot", group = "NORMAL (util)" }
  ),
  awful.key(
    { modKey },
    "Print",
    function ()
      awful.spawn("flameshot gui")
    end,
    { description = "screenshot", group = "NORMAL (util)" }
  ),
  awful.key(
    { modKey },
    "h",
    function ()
      awful.client.focus.bydirection("left")
    end,
    { description = "focus left by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey },
    "j",
    function ()
      awful.client.focus.bydirection("down")
    end,
    { description = "focus down by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey },
    "k",
    function ()
      awful.client.focus.bydirection("up")
    end,
    { description = "focus up by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey },
    "l",
    function ()
      awful.client.focus.bydirection("right")
    end,
    { description = "focus right by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey, 'Shift' },
    "h",
    function ()
      awful.client.swap.bydirection("left")
    end,
    { description = "swap left by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey, 'Shift' },
    "j",
    function ()
      awful.client.swap.bydirection("down")
    end,
    { description = "swap down by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey, 'Shift' },
    "k",
    function ()
      awful.client.swap.bydirection("up")
    end,
    { description = "swap up by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey, 'Shift' },
    "l",
    function ()
      awful.client.swap.bydirection("right")
    end,
    { description = "swap right by direction", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey },
    "u",
    function ()
      awful.client.urgent.jumpto()
    end,
    { description = "jump to urgent client", group = "NORMAL (client)" }
  ),
  awful.key(
    { altKey },
    "Tab",
    function ()
      awful.client.focus.byidx(1)
    end,
    { description = "focus next by inedx", group = "NORMAL (client)" }
  ),
  awful.key(
    { altKey, 'Shift' },
    "Tab",
    function ()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous by inedx", group = "NORMAL (client)" }
  ),
  awful.key(
    { modKey },
    "Return",
    function ()
      awful.spawn(apps.Default.Terminal)
    end,
    { description = "open a terminal", group = "NORMAL (launcher)" }
  ),
  awful.key(
    { modKey },
    "space",
    function ()
      awful.layout.inc(1)
    end,
    { description = "select next layout", group = "NORMAL (layout)" }
  ),
  awful.key(
    { modKey },
    "o",
    function ()
      mode.setMode('open')
    end,
    { description = "enter open mode", group = "NORMAL (mode)" }
  ),
  awful.key(
    { modKey },
    "v",
    function ()
      mode.setMode('settings')
    end,
    { description = "enter settings mode", group = "NORMAL (mode)" }
  ),
  awful.key(
    { modKey },
    "r",
    function ()
      mode.setMode('resize')
    end,
    { description = "enter resize mode", group = "NORMAL (mode)" }
  ),
  awful.key(
    { modKey },
    "w",
    function ()
      awful.spawn(apps.Default.WebBrowser)
    end,
    { description = "open default browser", group = "NORMAL (launcher)" }
  ),
  awful.key(
    { modKey },
    "a",
    function ()
      awful.tag.incnmaster(1)
    end,
    { description = "increase the number of master clients", group = "NORMAL (layout)" }
  ),
  awful.key(
    { modKey },
    "s",
    function ()
      awful.tag.incnmaster(-1)
    end,
    { description = "decrease the number of master clients", group = "NORMAL (layout)" }
  ),
  awful.key(
    { modKey },
    "z",
    function ()
      awful.tag.incncol(1)
    end,
    { description = "increase the number of columns", group = "NORMAL (layout)" }
  ),
  awful.key(
    { modKey },
    "x",
    function ()
      awful.tag.incncol(-1)
    end,
    { description = "decrease the number of columns", group = "NORMAL (layout)" }
  ),
  awful.key(
    { modKey },
    "d",
    function ()
      helpers.spawn.exec("rofi -modi drun -show drun")
    end,
    { description = "open rofi", group = "NORMAL (launcher)" }
  ),
  awful.key(
    { modKey },
    "Tab",
    function ()
      -- helper.MenuClientsCurrentTags()
      require('awsl.util.clients-menu')()
    end,
    { description = "show active clients", group = "NORMAL (client)"}
  )
)

for i = 1, 9 do
  normalKeys = gears.table.join(normalKeys,
    -- View tag only.
    awful.key({ modKey }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
           tag:view_only()
        end
      end,
      { description = "view tag #"..i, group = "NORMAL (tag)" }
    ),
    -- Toggle tag display.
    awful.key({ modKey, "Control" }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      { description = "toggle tag #" .. i, group = "NORMAL (tag)" }
    ),
    -- Move client to tag.
    awful.key({ modKey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = "move focused client to tag #"..i, group = "NORMAL (tag)" }
    )
    -- Toggle tag on focused client.
    -- awful.key({ modKey, "Control", "Shift" }, "#" .. i + 9,
      -- function ()
        -- if client.focus then
          -- local tag = client.focus.screen.tags[i]
          -- if tag then
            -- client.focus:toggle_tag(tag)
          -- end
        -- end
      -- end,
      -- { description = "toggle focused client on tag #" .. i, group = "NORMAL (tag)" }
    -- )
  )
end

return normalKeys
