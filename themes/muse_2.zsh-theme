#!/usr/bin/env zsh

setopt promptsubst

autoload -U add-zsh-hook

# Machine name.
function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

PROMPT_SUCCESS_COLOR=$FG[077]
PROMPT_FAILURE_COLOR=$FG[124]
PROMPT_VCS_INFO_COLOR=$FG[242]
PROMPT_PROMPT=$FG[077]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_INFO=$FG[012]
USER_COLOR=$FG[067]
if [[ "$USER" == "root" ]]; then
  USER_COLOR=$fg_bold[red]
fi

PROMPT='\
%{$USER_COLOR%}%n@$(box_name)%{$reset_color%} \
%{$PROMPT_SUCCESS_COLOR%}%~%{$reset_color%}\
%{$GIT_PROMPT_INFO%}$(git_prompt_info)$(virtualenv_prompt_info)\
%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}\
%(?:%{$PROMPT_SUCCESS_COLOR%}ᐅ:%{$PROMPT_FAILURE_COLOR%}ᐅ)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$GIT_PROMPT_INFO%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔"

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭%{$reset_color%}"

ZSH_THEME_VIRTUALENV_PREFIX=" ["
ZSH_THEME_VIRTUALENV_SUFFIX="]"
