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

### alacritty
##QEMU commands
qemu-system-x86_64 -boot d -hda /Users/nitin/QEMU/kali/kali1.qcow2 -m 8G -smp 4 -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::6666-:22 -accel hvf

qemu-img create -f qcow2  kali1.qcow2 60G


qemu-system-x86_64 -boot c -hda kali1.qcow2 -cdrom /Users/nitin/Downloads/kali-linux-2021.3a-installer-amd64-iso/kali-linux-2021.3a-installer-amd64.iso  -m 8G -smp 4 -device e1000,netdev=net0 -netdev user,id=net0,hostfwd=tcp::6666-:22 -accel hvf

## FZF in terminal
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```
if the repo is already cloned then you can just run the install and uninstall.

##Alacritty
```bash
git clone git@github.com:alacritty/alacritty.git
```

vim mode in alacritty: Ctrl+Shift+Space
- sroll on the terminal
- search through the text
- copy some text.(vim yanking)

Need to copy the config file in
```bash
mkdir -p ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty
```
