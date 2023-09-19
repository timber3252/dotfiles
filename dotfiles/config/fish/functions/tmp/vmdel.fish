function nsdel --description 'delete nspawn container'
  if test (count $argv) -lt 1
    echo "usage: nsdel <container_name>"
    return 1
  end

  sudo machinectl terminate "$argv[1]"
  sleep 1
  sudo machinectl remove "$argv[1]"
end
