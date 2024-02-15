#!/bin/zsh

start_tmux_session() {
  session_name=$1

  # Check if tmux is available and (tmux is not running or session_name is not active)
  if [[ $(command -v tmux) && ( ! $(ps -ef | grep "[t]mux") || ! $(tmux list-sessions | cut -d':' -f1 | grep "^${session_name}$") ) ]]; then

      # Start tmux session if not already running
      echo "starting tmux session ${session_name} "
      tmux new-session -d -s ${session_name}
  else
    echo "${session_name} is already running"
  fi
}

detach_tmux_session() {
  if [[ -n "${TMUX}" ]]; then
    tmux detach
  fi
}

select_tmux_session() {

  # Initialize an array
  sessions=()

  # Read lines into the array
  while IFS= read -r line; do
      sessions+=("$line")
  done <<< "$(tmux list-sessions | cut -d':' -f1 )"

  # Create an associative array to store indices and values
  # initialize associative array/map
  typeset -A options_assoc
  for i in {1..$#sessions}; do
      options_assoc[$i]=$sessions[i]
  done

  session_name=""
  # Prompt the user to select an option
  echo "enter 'n' to input new session name \nexit to exit" 
  select choice in "${options_assoc[@]}"; do
      # ensure option is not empty and REPLY is within bounds
      if [[ -n $choice ]]; then
        echo "You selected: $choice"
        session_name=$choice
        break
      elif [[ $REPLY == "exit" ]]; then
        exit 1
      elif [[ $REPLY == "n" ]]; then
        echo "creating a new session"
        echo "enter session name:"
        read session_name
        start_tmux_session $session_name
        break
      else
          echo "Invalid choice: ${REPLY}, value: ${choice}"
          exit 1
      fi
  done

  # attaching to session
  tmux attach-session -t $session_name
}

attach_to_tmux_session() {
  select_tmux_session
}
