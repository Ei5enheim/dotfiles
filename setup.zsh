# !/bin/zsh

export PS1="%F{green} %~> %f"
export PATH=$PATH:/opt/homebrew/bin

# install fzf binary
brew install fzf

# enable auto-complete
$(brew --prefix)/opt/fzf/install

# install fd
# alternative to fd which is faster.
brew install fd

# install ripgrep
brew install ripgrep

# install bat for syntax highlighting.
brew install bat

# install delta
brew install git-delta

# The absolute, canonical ( no ".." ) path to this script
curr_dir=$(cd -P -- "$(dirname -- "$0")" && echo "$(pwd -P)")

source ${curr_dir}/tmux/tmux_utilities.sh
primary_session_name="main"
# start main tmux session
start_tmux_session ${primary_session_name}

fzf_dir="${curr_dir}/fzf"
fzf_script="${fzf_dir}/fzf.zsh"
[ -f "${fzf_script}" ] && source "${fzf_script}"

fzf_git_script="${fzf_dir}/fzf-git.sh"
# download fzf-git file
if [[ ! -e "${fzf_git_script}" ]]; then
  curl -o "${fzf_git_script}" https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh
fi

source "${fzf_git_script}"
source "${curr_dir}/aliasrc"

# attach to tmux if not already. this is to avoid
# infinte loops
if [[ -z "${TMUX}" ]]; then
  attach_to_tmux_session ${primary_session_name}
fi
