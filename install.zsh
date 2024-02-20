# !/bin/zsh

# download JetBrainsMono Nerd front from here
# https://www.nerdfonts.com/font-downloads.
# and copy to /Library/Fonts/

# The absolute, canonical ( no ".." ) path to this script
curr_dir=$(cd -P -- "$(dirname -- "$0")" && echo "$(pwd -P)")
echo "source ${curr_dir}/setup.zsh" >> ~/.zshrc

# install tmux
brew install tmux

# install fzf binary
brew install fzf

fzf_version=$(fzf --version | cut -d' ' -f1)
# enable auto-complete
$(brew --prefix)/opt/fzf/install

tmux_file="/opt/homebrew/Cellar/fzf/${fzf_version}/bin/fzf-tmux"
if [ -e "${tmux_file}" ]; then
  rm -f /usr/local/bin/fzf-tmux
  ln ${tmux_file} /usr/local/bin/fzf-tmux
else
    echo "${tmux_file} does not exist"
fi

# install libtmux
pip3 install --user libtmux

python3 -m pip install dataclasses --user
# install fd
# alternative to fd which is faster.
brew install fd

# install ripgrep
brew install ripgrep

# install bat for syntax highlighting.
brew install bat

# install delta
brew install git-delta

if [[ ! -e "${HOME}/.tmux.conf" ]]; then
  ln "${curr_dir}/tmux/tmux.conf" ${HOME}/.tmux.conf
fi

# install TPM
mkdir -p ${HOME}/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
