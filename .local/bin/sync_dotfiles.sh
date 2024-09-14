#!/bin/bash
rsync -avz --delete $HOME/.dotfiles/ $HOME/Dropbox/.dotfiles/
