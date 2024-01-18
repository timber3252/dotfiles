local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

return function (s)
  s.topbar = awful.wibar({
    position = "top",
    screen = s
  })

  s.taglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = gears.table.join(
      awful.button({ }, 1, function (t) t:view_only() end),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
      awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
    )
  }

  s.layoutbox = awful.widget.layoutbox(s)
  s.layoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end)
  ))

  s.topbar:setup {
    layout = wibox.layout.align.horizontal,
    expand = 'none',
    wibox.widget {
      layout = wibox.layout.fixed.horizontal,
      mode.modeWidget,
      s.taglist,
      mode.hintWidget,
    },
    wibox.widget.textclock(),
    wibox.widget {
      layout = wibox.layout {
        layout = wibox.layout.fixed.horizontal,
      },
      playerctl.widget,
      battery.widget,
      cpu.widget,
      mem.widget,
      s.layoutbox,
    },
  }
end