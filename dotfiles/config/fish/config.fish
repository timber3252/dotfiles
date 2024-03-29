if test $(tty) = "/dev/tty1" && test -z (printenv HYPRLAND_INSTANCE_SIGNATURE)
  exec Hyprland
end

if status is-interactive
  # Locale
  export LANG="en_SG.UTF-8"
  export LC_ALL="en_SG.UTF-8"

  # Editor
  export SHELL="/usr/bin/fish"
  export EDITOR="nvim"

  # Environment variables
  set -x -g BAT_THEME "base16"
  fish_add_path ~/.scripts

  # Directory abbr
  abbr -a -g gc 'cd ~/.config/'
  abbr -a -g gd 'cd ~/Downloads/'
  abbr -a -g ge 'cd /etc/'
  abbr -a -g gh 'cd ~/'
  abbr -a -g gr 'cd ~/Repositories/'
  abbr -a -g grd 'cd ~/Repositories/dotfiles/'
end

