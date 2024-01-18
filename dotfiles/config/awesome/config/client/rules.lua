local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")

local clientKeys = require('config.keys.client')
local clientButtons = require('config.buttons.client')

local screenWidth = awful.screen.focused().workarea.width
local screenHeight = awful.screen.focused().workarea.height

local rules = {
  {
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientKeys,
      buttons = clientButtons,
      screen = awful.screen.preferred,
      size_hints_honor = false,
      titlebars_enabled = false,
    }
  },
  {
    rule_any = {
      instance = {
        'pinentry', -- gpg
      },
      class = {
        'Nm-connection-editor',
        'fcitx5-config-qt',
        'Pavucontrol',
        'Lxappearance',
      },
      name = {
        'Media viewer',
        'Terminator Preferences',
      },
      type = {
        "dialog",
      },
      role = {
        'pop-up', -- chrome detached developers tools
      },
    },
    properties = {
      floating = true,
      ontop = true,
      x = screenWidth / 4,
      y = screenHeight / 4,
      width = screenWidth / 2,
      height = screenHeight / 2,
    }
  },
  {
    rule_any = {
      name = {
        'Picture-in-picture'
      }
    },
    properties = {
      floating = true,
      ontop = true,
      sticky = true,
      x = screenWidth - screenWidth / 4 - beautiful.useless_gap * 2,
      y = screenHeight - screenHeight / 4 - beautiful.useless_gap * 2,
      width = screenWidth / 4,
      height = screenHeight / 4,
    }
  },
  {
    rule_any = {
      name = {
        'Media viewer',
      }
    },
    properties = {
      fullscreen = true,
      ontop = true,
    }
  },
  {
    rule_any = {
      class = {
        'TelegramDesktop',
        'telegram-desktop',
        'electron-netease-cloud-music',
        'Rhythmbox',
      }
    },
    properties = {
      tag = "#"
    }
  }
}

awful.rules.rules = rules

