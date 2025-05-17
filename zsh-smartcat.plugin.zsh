# Bat (cat alternative) plugin for ZSH

# Configurable theme (default: base16)
: ${BAT_THEME:=base16}

# Check for bat (modern replacement for cat)
if (( $+commands[bat] )) || (( $+commands[batcat] )); then
  local bat_cmd=${commands[bat]:-${commands[batcat]}}

  # Save original cat as rcat
  alias rcat="$(which cat)"

  # Main replacements
  alias cat="$bat_cmd --paging=never --theme=\"$BAT_THEME\""
  alias catp="$bat_cmd --paging=always --theme=\"$BAT_THEME\""  # With pager
  alias catn="$bat_cmd --paging=never --plain --theme=\"$BAT_THEME\""  # No decorations

  # Specialized views
  alias catd="$bat_cmd --diff --theme=\"$BAT_THEME\""          # Diff view
  alias catg="$bat_cmd --style=grid --theme=\"$BAT_THEME\""    # Grid view
  alias cats="$bat_cmd --style=snip --theme=\"$BAT_THEME\""    # Snippet view

  # Language-specific
  alias caty="$bat_cmd --language=yaml --theme=\"$BAT_THEME\"" # YAML
  alias catj="$bat_cmd --language=json --theme=\"$BAT_THEME\"" # JSON

  # Plain versions (no line numbers/headers)
  alias catnp="$bat_cmd --paging=always --plain --theme=\"$BAT_THEME\""
  alias catng="$bat_cmd --style=grid --plain --theme=\"$BAT_THEME\""

  # Configure manpager
  export MANPAGER="sh -c 'col -bx | $bat_cmd -l man -p --paging=never --theme=\"$BAT_THEME\"'"
  export MANROFFOPT="-c"

  # WSL specific optimizations
  if [[ -n "$WSL_DISTRO_NAME" ]]; then
    alias cat="$bat_cmd --paging=never --theme=\"$BAT_THEME\" --terminal-width=$(tput cols)"
    export BAT_PAGER="less -RF"
  fi
fi