#!/bin/bash

unison "$HOME/Dropbox/Aplicativos/espanso/personal.yml" "$HOME/.config/espanso/match/personal.yml" -batch
unison "$HOME/Dropbox/Aplicativos/newsboat/urls" "$HOME/.config/newsboat/urls" -batch
#unison "$HOME/Dropbox/Aplicativos/khal/" "$HOME/.local/share/khal/calendars/private/" -batch
unison "$HOME/Dropbox/Aplicativos/vimwiki/" "$HOME/vimwiki/" -batch
unison "$HOME/Dropbox/Aplicativos/.qn/" "$HOME/.qn/" -batch
