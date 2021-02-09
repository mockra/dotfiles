function fish_title
  if [ (status current-command) = 'fish' ]
    echo (prompt_pwd)

    if type -q tmux
      tmux rename-window (prompt_pwd)
    end
  else
    echo (status current-command)

    if type -q tmux
      tmux rename-window (status current-command)
    end
  end
end
