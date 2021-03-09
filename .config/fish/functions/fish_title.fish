function fish_title
  if [ (status current-command) = 'fish' ]
    echo (prompt_pwd)
  else
    echo (status current-command)
  end
end
