# dotfiles

## Usage

```bash
brew install chezmoi
chezmoi init --apply pengzhendong
brew bundle --file ~/.local/share/chezmoi/Brewfile
```

## Homebrew

Homebrew packages and casks are managed in `Brewfile`.
Run `brew bundle` after applying chezmoi to install the managed packages.

Some casks install system-level packages and may prompt for a sudo password:

- `karabiner-elements`: keyboard driver and system extension
- `squirrel-app`: input method under `/Library/Input Methods`
- `zerotier-one`: system network service

`orbstack` is installed as an app, but first launch may ask to finish privileged setup.

After changing installed packages locally, update the list with:

```bash
brew bundle dump --file ~/.local/share/chezmoi/Brewfile --force --no-vscode --no-mas --no-go --no-cargo --no-uv --no-flatpak --no-winget --no-krew --no-npm --no-describe
```
