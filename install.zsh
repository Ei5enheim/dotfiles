# !/bin/zsh

# The absolute, canonical ( no ".." ) path to this script
curr_dir=$(cd -P -- "$(dirname -- "$0")" && echo "$(pwd -P)")

echo "source ${curr_dir}/setup.zsh" >> ~/.zshrc
