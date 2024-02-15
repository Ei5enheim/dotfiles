# Setup fzf
# ---------

fzf_version=$(fzf --version | cut -d' ' -f1)
if [[ ! "$PATH" == */opt/homebrew/Cellar/fzf/${fzf_version}/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/Cellar/fzf/${fzf_version}/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/Cellar/fzf/${fzf_version}/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/Cellar/fzf/${fzf_version}/shell/key-bindings.zsh"
