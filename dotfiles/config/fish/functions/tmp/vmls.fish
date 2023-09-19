function nsls --description 'list nspawn containers'
  echo "Running containers:"
  sudo machinectl list $argv;

  echo

  echo "Available containers:"
  sudo machinectl list-images $argv;
end
