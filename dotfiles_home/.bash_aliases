# Paths
alias dot="cd .dotfiles"
alias feed="nvim ~/.newsboat/urls"

# Commands
alias ls="exa"
alias ka="killall"
alias :q="exit"
alias vi="nvim"
alias vim="nvim"
#alias lf="lfub"
alias nf="neofetch"

# Bookmarks
alias dl='cd ~/Downloads && ls -lA'
alias doc='cd ~/Documents && ls -lA'
alias tmp='cd ~/Temporary && ls -lA'


# Apps
alias firefox=firefox-developer-edition
alias news="newsboat"


# Git
alias gc="git commit -m"  # + commit message
alias gca="git add . && git commit -m"  # + commit message
alias gs="git status -sb"
alias gl="git log --pretty=short"
alias gd="git diff"
alias gds="git diff --staged"
alias gpom="git push origin main"
alias glom="git pull origin main"
alias gpo="git push origin"  # + branch name
alias glo="git pull origin"  # + branch name
alias gphm="git push hosted main"  # self-hosted git
alias gb="git checkout"  # + existing branch name
alias gbn="git checkout -b"  # + new branch name
alias grm="git rebase -i origin/main"
alias gsub="git submodule update --recursive --remote"
alias gundo="git reset --soft HEAD~1"
alias greset="git reset"
alias github="gh repo view --web"
alias gist="gh gist create --web"
alias ghnew="gh repo create"
alias ghfork="gh repo fork"
