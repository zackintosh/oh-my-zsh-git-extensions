# Outputs current branch info in prompt format
# Overrides the method in "oh-my-zsh/lib/git.zsh"
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
	if [[ "$(command git config --get oh-my-zsh.hide-dirty-state 2>/dev/null)" != "1" ]] then
    	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
	else
		echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_CLEAN$ZSH_THEME_GIT_PROMPT_SUFFIX"
	fi
  fi
}
