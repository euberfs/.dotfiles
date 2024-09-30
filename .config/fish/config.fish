#set -U fish_greeting
export VISUAL=nvim
export EDITOR="$VISUAL"

# bobthefish theme
#set -g theme_color_scheme gruvbox
set -g theme_color_scheme nord
#set -g theme_color_scheme dracula

set -g theme_display_git no
set -g theme_display_git_dirty no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv no
set -g theme_display_nix no
set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path no
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone America/Sao_Paulo
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '


# Aliases
########################################

# Path aliases
alias dot="cd .dotfiles"
alias db="cd ~/Dropbox"
alias i3="thunar ~/.config/i3"
alias doc="cd ~/Documents"
alias dow="cd ~/Downloads"
alias pic="cd ~/Pictures"
alias vid="cd ~/Videos"
alias mus="cd ~/Music"

# Configurations shortcuts
alias fish.conf='nvim ~/.config/fish/config.fish'
alias i3.conf='nvim ~/.config/i3/config'
alias nvim.conf='nvim ~/.config/nvim'
alias feed="nvim ~/.config/newsboat/urls"
alias espan="nvim ~/.config/espanso/match/personal.yml"

# Apps
alias news="newsboat"
alias note="joplin"
alias yt="pipe-viewer"
alias tt="taskwarrior-tui"
alias qnl="qnl | fzf"
alias cs="bash ~/.config/cheet/cheet"
alias tp="bat ~/Documents/topo | fzf"
alias rename="perl-rename"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'


# youtube-dl
# Update yt-dlp
alias ydlu='yt-dlp -U'

# Download only the audio of a video
alias ydla='yt-dlp -x --audio-format mp3'

# Download a video in the highest quality
alias ydlb='yt-dlp -f best'

# Download an entire playlist
alias ydlp='yt-dlp -f best --yes-playlist'

# Download an entire playlist and convert to mp3
alias ydl-pmp3='yt-dlp -x --audio-format mp3'

# Download subtitles along with the video
alias ydls='yt-dlp --write-sub --sub-lang en'

# Download a specific video
alias ydl-download='yt-dlp'


# git
alias addall='git add .'
alias add='git add '
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"

# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Play audio files in current dir by type
alias playwav='vlc *.wav'
alias playogg='vlc *.ogg'
alias playmp3='vlc *.mp3'

# Play video files in current dir by type
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

alias fz="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# Fucntion

# Search command not found
function nf
    set -l command (string join ' ' $argv)
    lynx "https://command-not-found.com/$command"
end
