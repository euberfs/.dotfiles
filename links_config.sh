#!/bin/bash

# Função para criar diretórios se não existirem
criar_diretorio() {
    [ ! -d "$1" ] && mkdir -p "$1"
}

# Função para criar links simbólicos
criar_link() {
    if [ -e "$1" ]; then
        criar_diretorio "$(dirname "$2")"
        ln -sfn "$1" "$2"
    else
        echo "Fonte não encontrada: $1"
    fi
}

# Lista de links a serem criados
links=(
    "$HOME/.dotfiles/.config/alacritty $HOME/.config/alacritty"
    "$HOME/.dotfiles/.config/cheet/cheatsheet $HOME/.config/cheet/cheatsheet"
    "$HOME/.dotfiles/.config/cmus/rc $HOME/.config/cmus/rc"
    "$HOME/.dotfiles/.config/cmus/themes $HOME/.config/cmus/themes"
    "$HOME/.dotfiles/.config/dunst/dunstrc $HOME/.config/dunst/dunstrc"
    "$HOME/.dotfiles/.config/fish/config.fish $HOME/.config/fish/config.fish"
    "$HOME/.dotfiles/.config/geany/colorschemes $HOME/.config/geany/colorschemes"
    "$HOME/.dotfiles/.config/geany/geany.conf $HOME/.config/geany/geany.conf"
    "$HOME/.dotfiles/.config/i3/config $HOME/.config/i3/config"
    "$HOME/.dotfiles/.config/i3/disable-touchscreen.sh $HOME/.config/i3/disable-touchscreen.sh"
    "$HOME/.dotfiles/.config/joplin/keymap.json $HOME/.config/joplin/keymap.json"
    "$HOME/.dotfiles/.config/joplin/settings.json $HOME/.config/joplin/settings.json"
    "$HOME/.dotfiles/.config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf"
    "$HOME/.dotfiles/.config/jrnl/jrnl.yaml $HOME/.config/jrnl/jrnl.yaml"
    "$HOME/.dotfiles/.config/mc/ini $HOME/.config/mc/ini"
    "$HOME/.dotfiles/.config/mc/ini $HOME/.config/mc/ini"
    "$HOME/.dotfiles/.config/mpd/mpd.conf $HOME/.config/mpd/mpd.conf"
    "$HOME/.dotfiles/.config/mutt/themes $HOME/.config/mutt/themes"
    "$HOME/.dotfiles/.config/ncmpcpp $HOME/.config/ncmpcpp"
    "$HOME/.dotfiles/.config/newsboat $HOME/.config/newsboat"
    "$HOME/.dotfiles/.config/nvim $HOME/.config/nvim"
    "$HOME/.dotfiles/.config/picom/picom.conf $HOME/.config/picom/picom.conf"
    "$HOME/.dotfiles/.config/rofi $HOME/.config/rofi"
    "$HOME/.dotfiles/.config/zathura/zathurarc $HOME/.config/zathura/zathurarc"
	"$HOME/.dotfiles/dotfiles_home/.bash_aliases $HOME/.bash_aliases"
	"$HOME/.dotfiles/dotfiles_home/.bashrc $HOME/.bashrc"
	"$HOME/.dotfiles/dotfiles_home/.profile $HOME/.profile"
	"$HOME/.dotfiles/dotfiles_home/.tmux.conf $HOME/.tmux.conf"
	"$HOME/.dotfiles/dotfiles_home/.xinitrc $HOME/.xinitrc"
	
	"$HOME/.dotfiles/.local/bin/ifinstalled $HOME/.local/bin/ifinstalled"
	
	"$HOME/.dotfiles/.local/share/mc $HOME/.local/share/mc"
	"$HOME/.dotfiles/.local/share/wallpaper $HOME/.local/share/wallpaper"
	
# Private	

	 "$HOME/.private/.config/mutt/muttrc $HOME/.config/mutt/muttrc"
	 "$HOME/.private/.config/espanso/personal.yml $HOME/.config/espanso/match/personal.yml"
	 "$HOME/.private/.config/newsboat/urls $HOME/.config/newsboat/urls"
	 "$HOME/.private/.qn $HOME/.qn"
)

# Criação dos links simbólicos
for link in "${links[@]}"; do
    origem=$(echo "$link" | awk '{print $1}')
    destino=$(echo "$link" | awk '{print $2}')
    
    if [ -d "$origem" ]; then
        # Se a origem é um diretório, criar links para cada arquivo
        for file in "$origem"/*; do
            criar_link "$file" "$destino/$(basename "$file")"
        done
    else
        criar_link "$origem" "$destino"
    fi
done

echo "Links simbólicos criados com sucesso."
