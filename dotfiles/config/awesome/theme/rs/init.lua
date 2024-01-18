local filesystem = require('gears.filesystem')
local gears = require('gears')
local dpi = require('beautiful').xresources.apply_dpi
local path = filesystem.get_configuration_dir() .. '/theme'

return function (theme)
  theme.icons = path .. '/icons/'
  theme.font = 'TerminessTTF Nerd Font 13'
  theme.font_bold = 'TerminessTTF Nerd Font 13'

  theme.system_black_dark = '#3D4C5F'
  theme.system_black_light = '#56687E'

  theme.system_red_dark = '#EE4F84'
  theme.system_red_light = '#F44336'

  theme.system_green_dark = '#53E2AE'
  theme.system_green_light = '#A1EFD3'

  theme.system_yellow_dark = '#F1FF52'
  theme.system_yellow_light = '#F1FA8C'

  theme.system_blue_dark = '#6498EF' 
  theme.system_blue_light = '#3281ea'

  theme.system_magenta_dark = '#985EFF'
  theme.system_magenta_light = '#BD99FF'

  theme.system_cyan_dark = '#24D1E7'
  theme.system_cyan_light = '#87DFEB'

  theme.system_white_dark = '#E5E5E5'
  theme.system_white_light = '#F8F8F2'

  theme.foreground = theme.system_white_light
  theme.background = '#000000' .. 'CF'
  theme.transparent = '#00000000'

  theme.wibar_bg = theme.background
  theme.wibar_fg = theme.foreground

  theme.border_width = dpi(1)
  theme.border_marked = theme.system_black_light
  theme.border_normal = theme.system_black_light
  theme.border_focus = theme.system_black_dark

  theme.menu_bg_normal = '#000000' .. '88'
  theme.menu_bg_focus = '#000000' .. '88'
  theme.menu_height = dpi(32)
  theme.menu_width = dpi(452)

  theme.useless_gap = dpi(2)

  theme.notification_bg = '#000000' .. 'CC'
  theme.notification_shape = function (cr, width, height)
    gears.shape.rounded_rect(cr, width, height, dpi(5))
  end
  theme.notification_font = 'TerminessTTF Nerd Font 14'

  theme.taglist_bg_urgent = theme.system_red_light
  theme.taglist_bg_focus = theme.system_black_light

end