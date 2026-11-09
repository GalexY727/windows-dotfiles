# Zenbook Zsh

The Ubuntu WSL setup uses Oh My Zsh's `robbyrussell` theme, Git aliases, `z` directory jumping, autosuggestions, extra completions, and syntax highlighting.

Run this in Ubuntu WSL from the cloned repository's `Zenbook/Zsh` directory. It reuses existing plugin installations and backs up an existing `~/.zshrc` to a uniquely named file before replacing it.

```bash
(
  set -e
  test -f .zshrc
  sudo apt update
  sudo apt install -y git zsh

  omz="$HOME/.oh-my-zsh"
  if [ ! -f "$omz/oh-my-zsh.sh" ]; then
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$omz"
  fi

  plugins_dir="${ZSH_CUSTOM:-$omz/custom}/plugins"
  mkdir -p "$plugins_dir"
  for plugin in zsh-autosuggestions zsh-completions zsh-syntax-highlighting; do
    if [ ! -d "$plugins_dir/$plugin" ]; then
      git clone --depth 1 "https://github.com/zsh-users/$plugin.git" "$plugins_dir/$plugin"
    fi
  done

  if [ -e "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
    backup="$(mktemp "$HOME/.zshrc.backup.XXXXXX")"
    cp -P -- "$HOME/.zshrc" "$backup"
    printf 'Previous config saved to %s\n' "$backup"
  fi
  install -m 644 .zshrc "$HOME/.zshrc"
)
```

Run `exec zsh` to start using it. To make Zsh the default for future WSL sessions, run `chsh -s "$(command -v zsh)"` and reopen WSL.

## Optional ROS 2 setup

Zsh checks the Ubuntu release inside WSL and loads the first installed match from `/opt/ros/<distro>/setup.zsh`.

| Ubuntu | Load order |
| --- | --- |
| 22.04 (Jammy) | Humble, then Iron |
| 24.04 (Noble) | Jazzy, then Kilted |

If no compatible setup file is available, Zsh starts normally. If the shell already inherits a ROS environment, it keeps that environment. See the [ROS 2 target platforms](https://reps.openrobotics.org/rep-2000/) for the Ubuntu release pairings.
