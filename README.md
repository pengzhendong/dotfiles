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

## Externals

chezmoi manages several external resources in `.chezmoiexternal.toml`:

- `~/.config/nvim`: LazyVim starter
- `~/Library/Rime`: rime-ice
- `~/Library/Application Support/iTerm2/ColorSchemes/iterm2-color-schemes`: iTerm2 color schemes

iTerm2 color presets are imported into iTerm2 preferences after choosing a theme.

## Terminals

`chezmoi apply` installs the `Dotfiles` profile in iTerm2 and sets it as the
default for new sessions. iTerm2 reads the updated preferences on launch.
Inactive split panes and background windows are not dimmed, and clicking a
command only focuses its pane instead of selecting the command.

chezmoi manages Warp keybindings and merges shared preferences into
`~/.warp/settings.toml`. Edit `.chezmoitemplates/warp-settings.toml` to change
the shared settings. Warp account settings, agent configuration, and MCP
servers are configured per installation.
