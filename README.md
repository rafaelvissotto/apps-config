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
# git config
git config --global include.path "~/.config/gitrc"
# vim config
ln -s ~/.config/vimrc ~/.vimrc
# konsole profiles
ln -s ~/.config/konsole/dark.profile ~/.local/share/konsole/dark.profile
ln -s ~/.config/konsole/light.profile ~/.local/share/konsole/light.profile
# konsole shortcuts
ln -s ~/.config/konsole/custom.shortcuts ~/.local/share/konsole/shortcuts/custom.shortcuts
```

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
docker  # or podman
mise
```
