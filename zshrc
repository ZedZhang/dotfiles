# hub autocomplete
# don't check for new mail
fpath=(/usr/local/share/zsh/site-functions $fpath)
alias git=hub
alias vi=vim
alias vizsh='vi ~/.zshrc'
alias vid='cd ~/vimwiki/diary/ && vim -c "VimwikiMakeDiaryNote" .'

alias mtr=/usr/local/sbin/mtr

export GIT_EDITOR=/usr/local/bin/vim

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path for android sdk
export ANDROID_HOME=/Users/zed/Library/Android/sdk
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:/Users/zed/Library/Android/sdk/platform-tools/
export PATH=$PATH:/Users/zed/Library/Android/sdk/tools/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby rvm gem brew bundler postgres osx npm nvm docker bgnotify)

# bgnotify settings
function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
  if ! (echo $2 | grep -q '^vi'); then
    [ $1 -eq 0 ] && title="执行成功，要下一步啦!" || title="执行失败，赶紧看看!"
    bgnotify "$title -- after $3 s" "$2";
  fi
}
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/Workspace/works/ezitask/bin/heroku.alias
alias gitum='git pull origin master'
alias gitud='git pull origin develop'
alias gitc='git checkout'
alias gitcb='git checkout -b'
alias gitcd='git checkout develop'
alias gitcm='git commit'
alias gitpu="git pull"
alias gitps="git push"
alias gitpr="git pull-request -a xifengzhu"
alias gitsr="gitps && gitpr"
alias gitbr="git browse -- pulls"
alias gitcr="git code-review"
alias gitpd="git checkout develop && git pull origin develop"
alias gitrm="git obliterate"
alias gitbn="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"

# alias tig
alias 'ts'="tig status"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export BUNDLER_EDITOR=vim

# directory shortcuts
alias ezi="~/Workspace/works/ezitask/"
alias ezii="~/Workspace/works/ezitask-ionic/"
alias til="~/Workspace/privates/til/"
alias lbw="~/Workspace/privates/labuwang/"
alias dop="~/Workspace/works/Doppler-API-backend/"
alias dopi="~/Workspace/works/Doppler-App/"

# get localhost ip
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# setup aria2
alias download="aria2c --conf-path='/Users/zed/.aria2/aria2.conf' -D"

# cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vl
export VL_ROOT="$HOME/.vl"
eval "$($VL_ROOT/bin/vl init -)"

# marked 2
alias mark='open -a "Marked 2"'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# alias gitcl="git branch -r| awk -F '[/]' '/feature\// {printf"%s/%s\n",$2,$3}' | grep -v 1307 |xargs -I{} git push origin :{}"

# GOPATH
export GOPATH=$HOME/Workspace/privates/go

# GOPATH bin
export PATH=$PATH:$GOPATH/bin

function gitmr {
  default_target_branch="develop"
  target_branch=$1
  # use default_target_branch for target_branch
  if [[ $target_branch == "" ]]; then
    target_branch=$default_target_branch
  fi

  gitlab_repo_url=`git ls-remote --get-url` # git@git.example.com:repo-name.git
  gitlab_user=`echo $gitlab_repo_url|cut -d @ -f 1`
  gitlab_host=`echo $gitlab_repo_url|cut -d : -f 1|cut -d @ -f 2`
  gitlab_repo=`echo $gitlab_repo_url|cut -d : -f 2|cut -d . -f 1`
  gitlab_web_url="http://${gitlab_host}/${gitlab_repo}"

  current_branch=`git rev-parse --abbrev-ref HEAD`

  String.titleize(){
    echo "$1" | sed -E -e "s/-|_/ /g" -e 's/\b(.)/\U\1/g'
  }
  gitlab_mr_title=`String.titleize $current_branch`

  # git_last_commit_message=`git log -1 --pretty=%B`
  # gitlab_mr_title=$git_last_commit_message

  gitlab_mr_url="${gitlab_web_url}/merge_requests/new?merge_request[source_branch]=${current_branch}&merge_request[target_branch]=${target_branch}&merge_request[title]=${gitlab_mr_title}&merge_request[assignee_id]=9"
  open "$gitlab_mr_url"
}

alias downloading='open "http://ziahamza.github.io/webui-aria2/"'
