function nsnew --description 'create nspawn container'
  if test (count $argv) -lt 2
    echo "usage: nsnew <distro>/<release>/<type> <container_name>"
    nspawn -l
    return 1
  end

  set distro (echo "$argv[1]" | cut -d "/" -f1)
  set release (echo "$argv[1]" | cut -d "/" -f2)
  set type (basename "$argv[1]")

  set default_name "$distro-$release-$type"
  if test default_name = "$argv[2]"
    echo "error: vm_name should not equal to $default_name"
    return 2
  end

  sudo nspawn -i "$argv[1]"
  sudo machinectl rename "$distro-$release-$type" "$argv[2]"
end

