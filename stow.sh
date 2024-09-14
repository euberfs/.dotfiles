#!/usr/bin/env bash

function check_prog() {
    if ! command -v "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting..."
        exit 1
    fi
}

# Check if the required commands are installed
check_prog stow
check_prog curl

# Create the configuration directory if it does not exist
mkdir -p "$HOME/.config"

# Change to the dotfiles directory and check if it exists
cd ~/.dotfiles || { echo "Directory ~/.dotfiles not found. Aborting..."; exit 1; }

# Run stow to create symbolic links for the directories
stow --target "$HOME" alacritty
stow --target "$HOME" cheet
stow --target "$HOME" cmus
stow --target "$HOME" fish --adopt
stow --target "$HOME" geany
stow --target "$HOME" dunst
stow --target "$HOME" i3
stow --target "$HOME" joplin
stow --target "$HOME" jrnl
stow --target "$HOME" khal
stow --target "$HOME" kitty
stow --target "$HOME" lf
stow --target "$HOME" mc
stow --target "$HOME" ncmpcpp
stow --target "$HOME" mpd
stow --target "$HOME" mutt
stow --target "$HOME" newsboat
stow --target "$HOME" nvim
stow --target "$HOME" scripts
stow --target "$HOME" picom
stow --target "$HOME" rofi
stow --target "$HOME" wallpaper
stow --target "$HOME" dotfiles_home
