# timber3252's dotfiles (until 2021.02)

These are the basic dotfiles that I start with when I set up a new environment.

Please **DO NOT** just copy this configuration folder without really look at it!

<!-- TOC GFM -->

* [Installation](#installation)
  - [Install Dotfiles](#install-dotfiles)
  - [Install Dependencies](#install-dependencies)
* [Applications](#applications)
  - [Desktop](#desktop)
  - [CLI](#cli)
  - [Utils](#utils)
* [License](#license)

<!-- /TOC -->

## Installation

### Install Dotfiles

```bash
git clone https://github.com/timber3252/dotfiles
cd dotfiles

# submodule init
git submodule update --init --recursive

# install necessary requirements for dotdrop
pip3 install -r dotdrop/requirements.txt --user

# for example, use the `timber-laptop` profile
./dotdrop.sh install -p timber-laptop
```

### Install Dependencies

In the [Applications](#Applications) part, I listed the majority of applications that are needed to normally run this dotfiles.

## Applications

The following part is my personal preferences for applications.

To use dotfiles, you need to **install packages below or replace some of them in the corresponding configuration file**.

### Desktop

| Type              | Name       | Package (Arch)         | Links                                                                                  | Desc.                  |
|-------------------|------------|------------------------|----------------------------------------------------------------------------------------|------------------------|
| Compositor        | picom      | `picom`                | [GitHub](https://github.com/yshui/picom), [Docs](https://github.com/yshui/picom/wiki)  | `~/.config/picom`      |
| Document Viewer   | zathura    | `zathura`              | [GitHub](https://github.com/pwmt/zathura)                                              | `~/.config/zathura`    |
| Terminal Emulator | terminator | `terminator`           | [GitHub](https://github.com/gnome-terminator/terminator)                               | `~/.config/terminator` |
| Web Browser       | chrome     | `google-chrome-stable` |                                                                                        |                        |
| Window Manager    | awesome    | `awesome`              | [GitHub](https://github.com/awesomeWM/awesome), [Docs](https://awesomewm.org/doc/api/) | `~/.config/awesome`    |

### CLI

| Type         | Name   | Package (Arch) | Links                                                                                                     | Desc.              |
|--------------|--------|----------------|-----------------------------------------------------------------------------------------------------------|--------------------|
| Editor       | neovim | `neovim`       | [GitHub](https://github.com/neovim/neovim), [Docs](https://github.com/neovim/neovim/wiki)                 | `~/.config/nvim`   |
| File Manager | ranger | `ranger`       | [GitHub](https://github.com/ranger/ranger), [Docs](https://github.com/ranger/ranger/wiki)                 | `~/.config/ranger` |
| Shell        | fish   | `fish`         | [GitHub](https://github.com/fish-shell/fish-shell), [Docs](https://fishshell.com/docs/current/index.html) | `~/.config/fish`   |

### Utils

| Type                       | Name                | Package (Arch)                      | Links                                                        | Desc. |
|----------------------------|---------------------|-------------------------------------|--------------------------------------------------------------|-------|
| Bluetooth                  | blueman             | `blueman`                           | [GitHub](https://github.com/blueman-project/blueman)         |       |
| Brightness Control         | brightnessctl       | `brightnessctl`                     | [GitHub](https://github.com/Hummer12007/brightnessctl)       |       |
| Eyes Protection            | redshift            | `redshift`                          | [GitHub](https://github.com/jonls/redshift)                  |       |
| Input Method               | fcitx5              | `fcitx5`                            | [GitHub](https://github.com/fcitx/fcitx5)                    |       |
| Launcher & Window Switcher | rofi                | `rofi`                              | [GitHub](https://github.com/davatorium/rofi)                 |       |
| Network Manager            | networkmanager      | `nm-applet`, `nm-connection-editor` | [GitHub](https://github.com/NetworkManager/NetworkManager)   |       |
| Policy Kit                 | polkit-gnome        | `polkit-gnome`                      |                                                              |       |
| Power Manager              | xfce4-power-manager | `xfce4-power-manager`               | [GitHub](https://github.com/xfce-mirror/xfce4-power-manager) |       |
| Screenshot                 | flameshot           | `flameshot`                         | [GitHub](https://github.com/flameshot-org/flameshot)         |       |
| Volumn Control             | pulsemixer          | `pulsemixer`                        | [GitHub](https://github.com/GeorgeFilipkin/pulsemixer)       |       |

## License

MIT

