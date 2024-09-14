#!/bin/bash
rsync -avz --delete $HOME/.config/espanso/match/personal.yml $HOME/Dropbox/Aplicativos/espanso/
rsync -avz --delete $HOME/.config/newsboat/urls $HOME/Dropbox/Aplicativos/newsboat
rsync -avz --delete $HOME/.qn/* $HOME/Dropbox/Aplicativos/qn/
rsync -avz --delete $HOME/.local/share/khal/calendars/private/* $HOME/Dropbox/Aplicativos/khal/
rsync -avz --delete $HOME/.local/share/jrnl/journal.txt $HOME/Dropbox/Aplicativos/jrnl/
