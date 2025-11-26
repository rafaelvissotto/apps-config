# How to initialize repository:

```sh
cd ~/.config
git init
git remote add origin <this repo>
git fetch
git checkout -t origin/main
git submodule update --init --recursive --remote --rebase
```

### Configuring tools

```sh
# zsh
echo 'source "$HOME/.config/zsh/zshrc"' >> ~/.zshrc

# load mise shims
echo 'export PATH="$HOME/.local/share/mise/shims:$PATH"' >> ~/.zprofile

# git config
git config --global include.path "~/.config/gitrc"

# vim config
ln -s ~/.config/vim/vimrc ~/.vimrc

# konsole profiles
ln -s ~/.config/konsole/dark.profile ~/.local/share/konsole/dark.profile
ln -s ~/.config/konsole/light.profile ~/.local/share/konsole/light.profile

# konsole shortcuts
ln -s ~/.config/konsole/custom.shortcuts ~/.local/share/konsole/shortcuts/custom.shortcuts
```

##### Konsole wrapper to follow plasma theme

```sh
ln -s ~/.config/konsole/wrapper.sh ~/.local/bin/konsole
```
Also change in the application menu from plasma to ~/.local/bin/konsole,
otherwise it points to /usr/bin/konsole

##### Ignore vscode settings changes locally

```sh
echo "/Code/**" >> ~/.config/.git/info/exclude
git update-index --skip-worktree Code/User/settings.json
```

# List of tools

The idea is to keep this list to easily use it to install tools from the system
package manager (apt, dnf, pacman).

### Basic

```sh
git \
vim \
zsh
```

### Specific

Tools that I install only in the main environment

```sh
konsole
```

### Alternative

Tools that require may require some alternative install method.

```sh
# podman
docker \ 
mise
```
