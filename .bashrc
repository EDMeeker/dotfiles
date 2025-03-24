# Git branch display functions
# =============================================================================

# Extract and format the current git branch name
function parse_git_branch() {
  BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  if [[ -n "$BRANCH" ]]; then
    STAT=$(parse_git_dirty)

    # Format main/master branches in colon color (60)
    # Format other branches in path color (139)
    # Always display brackets in colon color (60)
    if [[ "$BRANCH" == "master" || "$BRANCH" == "main" ]]; then
      echo "%F{60}[${BRANCH}%f${STAT}%F{60}]%f"
    else
      echo "%F{60}[%F{139}${BRANCH}%f${STAT}%F{60}]%f"
    fi
  else
    echo ""
  fi
}

# Detect git repository status changes
function parse_git_dirty() {
  status=$(git status 2>&1)
  dirty=$(echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
  untracked=$(echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
  ahead=$(echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
  newfile=$(echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
  renamed=$(echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
  deleted=$(echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")
  bits=''
  
  # Build status indicators with consistent pink color (174)
  if [[ "${renamed}" == "0" ]]; then
    bits="%F{174}>%f${bits}"
  fi
  if [[ "${ahead}" == "0" ]]; then
    bits="%F{174}*%f${bits}"
  fi
  if [[ "${newfile}" == "0" ]]; then
    bits="%F{174}+%f${bits}"
  fi
  if [[ "${untracked}" == "0" ]]; then
    bits="%F{174}?%f${bits}"
  fi
  if [[ "${deleted}" == "0" ]]; then
    bits="%F{174}x%f${bits}"
  fi
  if [[ "${dirty}" == "0" ]]; then
    bits="%F{174}!%f${bits}"
  fi
  
  # Return formatted status indicators or empty string
  if [[ -n "${bits}" ]]; then
    echo " ${bits}"
  else
    echo ""
  fi
}

# Terminal and prompt configuration
# =============================================================================

# Enable 256 color support
autoload -U colors && colors

# Enable prompt substitution for dynamic content
setopt PROMPT_SUBST

# Color reference guide:
# 60 - MediumPurple4 - For brackets, main/master branches, and colon
# 139 - Grey63 - For path and non-main/master branches
# 174 - LightPink3 - For git status indicators

# Set prompt in "path [branch]:" format
PROMPT='%F{139}%2~%f$(git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* .*/\ /")$(parse_git_branch) '

# Aliases
# =============================================================================

# Use config as 'git add' when managing dotfiles.
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
