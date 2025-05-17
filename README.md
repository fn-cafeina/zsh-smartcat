# zsh-smartcat

> 🐱 Enhanced `cat` with [`bat`](https://github.com/sharkdp/bat) — syntax highlighting, theming, and more.
> 🛠️ Smart aliases and extras for an improved terminal experience in ZSH.

## 🧩 Features

- **Automatic detection** of `bat` or `batcat`
- **Replaces** `cat` with `bat` using themeable syntax highlighting
- Adds aliases for:
  - Paging, diff view, grid/snippet view
  - JSON/YAML pretty printing
  - Plain text mode (no line numbers or headers)
- Man pages rendered with `bat` for better readability
- WSL (Windows Subsystem for Linux) specific tweaks

## 📦 Installation

### Using [Oh My Zsh](https://ohmyz.sh/)

1. Clone the repo into your custom plugins directory:

``` bash
git clone https://github.com/fn-cafeina/zsh-smartcat ~/.oh-my-zsh/custom/plugins/zsh-smartcat
```
2. Then add zsh-smartcat to the plugins list in your .zshrc:

``` bash
plugins=(... zsh-smartcat)
```

3. Reload your shell:

``` bash
source ~/.zshrc
```

## ⚙️ Configuration

You can optionally set a custom theme before loading the plugin.
Defaults to base16 if not specified.

``` bash
export BAT_THEME="Dracula"  # or any theme supported by bat
```

## 🧠 Aliases

| Alias   | Description                                |
| ------- | ------------------------------------------ |
| `cat`   | Main alias with no pager and theme applied |
| `rcat`  | Original `cat` command                     |
| `catp`  | With pager (`less`)                        |
| `catn`  | Plain, no decorations                      |
| `catd`  | Diff view                                  |
| `catg`  | Grid view                                  |
| `cats`  | Snippet view                               |
| `caty`  | YAML syntax highlighting                   |
| `catj`  | JSON syntax highlighting                   |
| `catnp` | Plain + pager                              |
| `catng` | Grid view + plain style                    |

## 📖 Man Page Integration

Man pages are displayed using bat:

``` bash
man <command>
```

## 🪟 WSL Support

### When running under WSL:

- Forces fixed terminal width using tput cols
- Sets a custom pager for better WSL compatibility

## 📜 License

[MIT](LICENSE)
