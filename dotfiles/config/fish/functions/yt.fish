function yt --description 'yt-dlp -f bestvideo+bestaudio --cookies-from-browser librewolf'
  yt-dlp -f bestvideo+bestaudio --cookies-from-browser "firefox:$HOME/.librewolf" $argv;
end
