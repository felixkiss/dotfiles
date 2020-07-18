# felixkiss.zsh-theme

# Use with a dark background
# Meant for people using git. Tested only on OS X 10.9.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#  - fino-time
#  - bureau

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

fk_colored () {
  echo "%F{$1}$2%F{reset}"
}

fk_bold () {
  echo "%{$terminfo[bold]%}$1%{$reset_color%}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="$(fk_colored 239 on) %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=$(fk_colored green $(fk_bold ✓))
ZSH_THEME_GIT_PROMPT_AHEAD=$(fk_colored cyan ▴)
ZSH_THEME_GIT_PROMPT_BEHIND=$(fk_colored magenta ▾)
ZSH_THEME_GIT_PROMPT_STAGED=$(fk_colored green $(fk_bold ●))
ZSH_THEME_GIT_PROMPT_UNSTAGED=$(fk_colored yellow $(fk_bold ●))
ZSH_THEME_GIT_PROMPT_UNTRACKED=$(fk_colored red $(fk_bold ●))

_USER=$(fk_colored green %n)
_AT=$(fk_colored 239 at)
_MACHINE=$(fk_colored 033 $(box_name))
_IN=$(fk_colored 239 in)
_DIR=$(fk_colored 226 $(fk_bold %~))
_TIME=$(fk_colored 239 "[%D{%H:%M:%S}]")

_PROMPT_SHAPE_LINE_1='╭──'
_PROMPT_SHAPE_LINE_2='╰─○'
_PROMPT_SHAPE_COLOR_1='white'
_PROMPT_SHAPE_COLOR_2='white'

bureau_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status () {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  _STATUS=""
  if $(echo "$_INDEX" | grep '^[AMRD]. ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi
  if $(echo "$_INDEX" | grep '^.[MTD] ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi
  if $(echo "$_INDEX" | grep -E '^\?\? ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi
  if $(echo "$_INDEX" | grep '^UU ' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | grep '^## .*diverged' &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi
  if [[ "${_STATUS}" == "" ]]; then
    _STATUS="$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
  echo $_STATUS
}

bureau_git_prompt () {
  local _branch=$(bureau_git_branch)
  local _status=$(bureau_git_status)
  local _result=""
  if [[ "${_branch}" != "" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}" != "" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}

fk_prompt_shape_1 () {
  local last_status=$_PROMPT_LAST_COMMAND_RETURN_CODE

  if [[ "$last_status" != "0" ]]; then
    _PROMPT_SHAPE_COLOR_1='red'
  fi

  echo $(fk_colored "$_PROMPT_SHAPE_COLOR_1" "$_PROMPT_SHAPE_LINE_1")
}

fk_prompt_shape_2 () {
  local last_status=$_PROMPT_LAST_COMMAND_RETURN_CODE

  if [[ "$last_status" != "0" ]]; then
    _PROMPT_SHAPE_LINE_2='╰─✕'
    _PROMPT_SHAPE_COLOR_2='red'
  fi

  echo $(fk_colored "$_PROMPT_SHAPE_COLOR_2" "$_PROMPT_SHAPE_LINE_2")
}

fk_prompt_1_right () {
  echo "$(fk_last_cmd_status) $_TIME"
}

fk_prompt_1_left () {
  echo "$(fk_prompt_shape_1) $_USER $_AT $_MACHINE $_IN $_DIR $(bureau_git_prompt)"
}

fk_prompt_2_left () {
  echo "$(fk_prompt_shape_2)"
}

fk_prompt_2_right () {
  echo "$(fk_colored 250 !$(fk_bold %!))\n"
}

fk_repeat_string () {
  local char="$1"
  local times="$2"

  [[ $times -gt 0 ]] && printf '%*s\n' $times "" | tr ' ' $char
}

fk_justify_between () {
  local whole_line="$1$2"
  local zero='%([BSUbfksu]|([FB]|){*})'
  local length=${#${(S%%)whole_line//$~zero/}}
  local spaces_needed=$(($COLUMNS - $length - ${3:-0}))

  echo "$(fk_repeat_string ' ' $spaces_needed)"
}

fk_display_line () {
  local output="$1"
  local space_between=$(fk_justify_between "$1" "$2" "$3")

  if [[ "$space_between" != "" ]]; then
    # Enough space, display space + right side
    output="$output$space_between$2"
  fi

  echo "$output"
}

fk_last_cmd_status () {
  local last_status=$_PROMPT_LAST_COMMAND_RETURN_CODE
  local duration=$_PROMPT_LAST_COMMAND_DURATION
  local output=""

  if [[ "$last_status" == "0" ]]; then
    output="$output$(fk_colored green $(fk_bold ✓))"
  else
    output="$output$(fk_colored red "$last_status ⇤")"
  fi

  if [[ "$duration" != "" ]]; then
    output="$output $duration"
  fi

  echo "$output"
}

if [[ $(print -P "%#") == '#' ]]; then
  # privileged
  _USER=$(fk_colored magenta %n)
  _PROMPT_SHAPE_LINE_1='╭──'
  _PROMPT_SHAPE_LINE_2='╰─✪'
fi

_PROMPT_LINE_1_LEFT="$(fk_prompt_shape_1) $_USER $_AT $_MACHINE $_IN $_DIR $(bureau_git_prompt)"
_PROMPT_LINE_1_RIGHT="$(fk_last_cmd_status)$_TIME"
_PROMPT_LINE_2_LEFT="$(fk_prompt_shape_2)"
_PROMPT_LINE_2_RIGHT="$(fk_colored 250 !$(fk_bold %!))"

PROMPT='
$(fk_display_line "$(fk_prompt_1_left)" "$(fk_prompt_1_right)" 3)
$(fk_prompt_2_left) '

RPROMPT='$(fk_prompt_2_right)'
