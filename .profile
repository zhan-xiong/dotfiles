alias ls="ls --color=auto"

# Git aliases.
if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  _my_git_checkout()
  {
    __git_has_doubledash && return
    case "$cur" in
    --conflict=*)
      __gitcomp "diff3 merge" "" "${cur##--conflict=}"
      ;;
    --*)
      __gitcomp "
        --quiet --ours --theirs --track --no-track --merge
        --conflict= --orphan --patch
        "
      ;;
    *)
      # check if --track, --no-track, or --no-guess was specified
      # if so, disable DWIM mode
      local flags="--track --no-track --no-guess" track=1
      if [ -n "$(__git_find_on_cmdline "$flags")" ]; then
        track=''
      fi
      __gitcomp_nl "$(__git_heads "" "$cur" " " )"
      ;;
    esac
  }
  __git_complete gc _my_git_checkout
fi
alias gs="git status"
alias gl="git log --graph --decorate"
