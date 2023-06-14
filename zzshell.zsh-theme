PROMPT="%{$fg_bold[black]%}%n@%M"
if [ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]; then
  WSL_DISTRO_NAME="$(IFS='\';x=($(wslpath -w /));echo "${x[${#x[@]}-1]}")"
  PROMPT+="($WSL_DISTRO_NAME)"
fi

PROMPT+=" %(?::%{$fg_bold[yellow]%}%? )"
if [ $(id -u) -eq 0 ]
then
  PROMPT+="%{$fg_bold[white]%}%{$bg[red]%}#%{$reset_color%} "
fi
PROMPT+="%(?:%{$fg_bold[green]%}>:%{$fg_bold[red]%}>)"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
