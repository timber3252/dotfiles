local awful = require('awful')

--- should be loaded after layout init
awful.screen.connect_for_each_screen(
  function (s)
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8" }, s, awful.layout.layouts[1])
    awful.tag.add("#", { screen = s, layout = awful.layout.layouts[2] })
    require('layout.top-bar')(s)
  end
)