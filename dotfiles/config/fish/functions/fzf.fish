function fzf --description 'fzf --preview \'head -100 {}\''
  command fzf --preview 'head -100 {}' $argv;
end
