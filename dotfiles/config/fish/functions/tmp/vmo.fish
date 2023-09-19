function nso --description 'connect to nspawn container'
  if test (count $argv) -lt 1
    echo "usage: nso <container_name>"
    return 1
  end

  sudo machinectl start "$argv[1]"
  sleep 1
  sudo machinectl shell "$argv[1]"
end
