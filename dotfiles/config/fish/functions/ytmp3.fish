function ytmp3 --description 'yt-dlp -x -f bestaudio --cookies-from-browser librewolf'
  yt-dlp -x -f bestaudio --cookies-from-browser "firefox:$HOME/.librewolf" $argv;
end
