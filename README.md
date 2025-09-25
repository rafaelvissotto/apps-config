#### How to initialize repository:

```sh
cd ~/.config
git init
git remote add origin <this repo>
git fetch
git checkout -t origin/main
git submodule update --init --recursive --remote
```
