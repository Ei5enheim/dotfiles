# !/bin/zsh

# The absolute, canonical ( no ".." ) path to this script
curr_dir=$(cd -P -- "$(dirname -- "$0")" && echo "$(pwd -P)")
echo "source ${curr_dir}/setup.zsh" >> ~/.zshrc

# install tmux
brew install tmux

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
