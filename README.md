# dotfiles

Personal macOS configuration managed by chezmoi. Homebrew installs the software
listed in [Brewfile](Brewfile), and chezmoi applies files and preferences.

## Set up a Mac

With Homebrew available, run:

```bash
brew install chezmoi
chezmoi init pengzhendong
brew bundle install --file "$(chezmoi source-path)/Brewfile"
chezmoi apply
```

Install the Brewfile packages before the first apply so that the Hammerspoon
login agent can be registered and Rime can be deployed. Karabiner-Elements,
Squirrel and ZeroTier install system components and may ask for an administrator
password. OrbStack may ask to finish setup on first launch.

To use the launcher configuration, install Tinycast separately with
`brew install --cask tinycast` and install Easy Dictionary from Tinycast's
extension store. The repository supplies the launcher's preferences and the
extension's settings.

## Update an existing Mac

```bash
chezmoi update --apply=false
chezmoi status
chezmoi diff
chezmoi apply
```

Review the diff locally before applying, especially if you edit an app's settings
on this Mac. A plain `chezmoi update` pulls and applies in one step. To install
packages added to the Brewfile, run the bundle command above.

Edit [Brewfile](Brewfile) when you want to change the shared package list.
`brew bundle dump --file=-` prints the packages on the current Mac for comparison.

## Managed configuration

- **macOS** — scripts set Dock position and recents, trackpad three-finger drag,
  the built-in keyboard's Caps Lock/Control swap, and menu bar preferences. They
  also set up Hammerspoon at login and configure Itsycal and Thaw.
- **iTerm2** — installs the `Dotfiles` profile with its fonts and light/dark
  colors, selects it for new sessions, and disables selecting and shading a
  command when clicked. iTerm2 reads these preferences on launch. Edit the
  [profile](.chezmoitemplates/iterm2-profile.json) to update it.
- **Warp** — manages [keybindings](dot_warp/keybindings.yaml) and merges
  [shared settings](.chezmoitemplates/warp-settings.toml) into
  `~/.warp/settings.toml`. Account settings, agent configuration and MCP
  servers are managed separately.
- **Tinycast** — sets the launcher shortcut to `⌥ Space`, the interface to
  Simplified Chinese, the quick action language to Chinese, and the Easy
  Dictionary alias to `yd`. Relaunch Tinycast after changing its preferences.
  The [Easy Dictionary template](.chezmoitemplates/easydict-preferences.json)
  updates shared preferences while preserving local extension data.
- **Claude Code** — manages shared settings and the Claude HUD configuration.
  Set up the Claude HUD plugin and Bun separately if you use the status line.
  Review local settings such as cc-switch's `env` block before applying.

[.chezmoiexternal.toml](.chezmoiexternal.toml) fetches Oh My Zsh, Powerlevel10k,
Zinit, Oh My Tmux, LazyVim's starter, the iTerm2 color scheme collection, and
rime-ice. Rime overrides live under `private_Library/Rime/`. The deploy script
runs after apply when the Squirrel deployer is available.
