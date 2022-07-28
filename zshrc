#
# Executes commands at the start of an interactive session.
#

# add homebrewed binaries at beginning of path
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$PATH

# add homebrew completion's
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit && compinit
fi

# asdf
if type asdf &>/dev/null; then
  . $(brew --prefix asdf)/asdf.sh
fi

# add completions for poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# fix UTF errors
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# export Editor; e.g. used by espanso
export EDITOR=/opt/homebrew/bin/nvim


# Add some aliases
alias du="dust"
alias find="fd"
alias ls='exa'
alias ll='exa -alh'
alias sed='sd'
alias time="hyperfine"
alias vim="nvim"

# Luminovo functions
lumi-add-ip-to-prod-db-firewall() {
    az postgres flexible-server firewall-rule create --resource-group LumiQuote-data --name lumiquote-prod-11-18 --rule-name `whoami`-allowip --start-ip-address `curl ifconfig.me` --end-ip-address `curl ifconfig.me`
}
lumi-remove-ip-from-prod-db-firewall() {
    az postgres flexible-server firewall-rule delete --rule-name `whoami`-allowip --resource-group LumiQuote-data --name lumiquote-prod-11-18 --yes
}

# add gcloud auto completion
if [[ -d "$(brew --prefix)/Caskroom/google-cloud-sdk" ]]; then
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
fi

# Add fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd -HI --follow --exclude ".git" --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use jump
eval "$(jump shell)"

# use Starship prompt
eval "$(starship init zsh)"
