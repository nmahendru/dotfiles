# dotfiles

## pre neovim setup
```bash
brew install the_silver_searcher node fzf
```
## neovim setup.
```bash
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/.
mkdir -p ~/.local/share/nvim/site/plugin/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Then install all the packages using below on nvim startup:
PlugInstall
```
