- [Verificar se o sistema está usando UEFI:](#verificar-se-o-sistema-est--usando-uefi-)
- [Definir o layout do teclado](#definir-o-layout-do-teclado)
- [Particionar o disco](#particionar-o-disco)
- [Formatar e montar partições](#formatar-e-montar-parti--es)
- [Conectar à Internet](#conectar---internet)
- [Instalar o sistema base](#instalar-o-sistema-base)
- [Gerar fstab](#gerar-fstab)
- [Verifique o fstab resultante em busca de erros antes de reiniciar.](#verifique-o-fstab-resultante-em-busca-de-erros-antes-de-reiniciar)
- [Configurar o relógio do sistema](#configurar-o-rel-gio-do-sistema)
- [Idioma](#idioma)
- [Adicionar usuário(s)](#adicionar-usu-rio-s-)
- [Pacotes úteis](#pacotes--teis)
- [Configuração de rede](#configura--o-de-rede)
- [Reiniciar o sistema](#reiniciar-o-sistema)
- [Conceder acesso root ao nosso usuário](#conceder-acesso-root-ao-nosso-usu-rio)
- [Adicionar o nome de usuário ao arquivo Sudoers](#adicionar-o-nome-de-usu-rio-ao-arquivo-sudoers)
- [Fazer login com o usuário recém-criado](#fazer-login-com-o-usu-rio-rec-m-criado)
- [Diretório HOME](#diret-rio-home)
- [Configuração pós-instalação](#configura--o-p-s-instala--o)
- [Reiniciar o sistema](#reiniciar-o-sistema-1)
- [Adicionar asteriscos quando digitar sua senha](#adicionar-asteriscos-quando-digitar-sua-senha)
- [Atualizar](#atualizar)
- [Corrigir o erro "unable to lock database" no Arch Linux](#corrigir-o-erro--unable-to-lock-database--no-arch-linux)
- [Remover pacotes órfãos](#remover-pacotes--rf-os)
- [Se houver erro "externally-managed-environment"](#se-houver-erro--externally-managed-environment-)
- [Problemas de som com múltiplas placas](#problemas-de-som-com-m-ltiplas-placas)
- [Adicionar este conteúdo em alsa-base.conf (troca as placas de som, então 1 é padrão)](#adicionar-este-conte-do-em-alsa-baseconf--troca-as-placas-de-som--ent-o-1---padr-o-)
- [Habilitar áudio](#habilitar--udio)
- [Atualizar fontes](#atualizar-fontes)
- [Remover pacotes órfãos](#remover-pacotes--rf-os-1)
- [Snapshot com Timeshift](#snapshot-com-timeshift)
- [Atualizar](#atualizar-1)
- [Tema e ícones](#tema-e--cones)
- [Impressora HP](#impressora-hp)
- [polybar](#polybar)
- [yay](#yay)
- [tmux](#tmux)
- [fish](#fish)
- [fzf](#fzf)
- [Vim-Instant-Markdown](#vim-instant-markdown)
- [lf](#lf)
- [bluetooth](#bluetooth)
- [Podgrab](#podgrab)
- [Quick Note](#quick-note)
- [npm](#npm)
- [qgis](#qgis)
- [Virtualbox](#virtualbox)
- [Joplin](#joplin)
- [ncmpcpp and mpd](#ncmpcpp-and-mpd)
- [newsboat](#newsboat)
- [mutt](#mutt)
- [cheet](#cheet)
- [Firefox](#firefox)
- [GitHub](#github)
- [Sync dotfiles with dropbox](#sync-dotfiles-with-dropbox)
- [zsh](#zsh)

# Verificar se o sistema está usando UEFI:

	ls /sys/firmware/efi/efivars

# Definir o layout do teclado

	ls -R /usr/share/kbd/keymaps

# Particionar o disco

	cfdisk /dev/sda

# Formatar e montar partições

	mkfs.fat -F 32 /dev/sda1
	mkswap /dev/sda2
	mkfs.btrfs /dev/sda3
	mkfs.btrfs /dev/sda4

	mount /dev/sda3 /mnt
	mkdir /mnt/home
	mkdir /mnt/boot
	mkdir /mnt/boot/efi
	mount /dev/sda4 /mnt/home
	mount /dev/sda1 /mnt/boot
	mount /dev/sda1 /mnt/boot/efi
	swapon /dev/sda2

# Conectar à Internet

	ping artixlinux.org

	iwctl
	station list
	station YOURDEVICE get-networks
	station YOURDEVICE connect YOURWIFI
	PASSWORD

# Instalar o sistema base

	pacstrap /mnt base base-devel linux linux-firmware dhcpcd neovim git

# Gerar fstab

	fstabgen -U /mnt >> /mnt/etc/fstab

# Verifique o fstab resultante em busca de erros antes de reiniciar.

	arch-chroot /mnt

# Configurar o relógio do sistema

	ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
	hwclock --systohc

# Idioma

	pacman -Syu
	nano /etc/locale.gen
	locale-gen

Para definir o locale no sistema, crie ou edite `/etc/locale.conf` (que é carregado por `/etc/profile`) ou `/etc/bash/bashrc.d/artix.bashrc` ou `/etc/bash/bashrc.d/local.bashrc`; alterações específicas para o usuário podem ser feitas em seu respectivo `~/.bashrc`, por exemplo:

	export LANG="en_US.UTF-8"    
	export LC_COLLATE="C"

# Adicionar usuário(s)

	passwd
	useradd -m -g users -G wheel,storage,power -s /bin/bash USERNAME
	passwd user

# Pacotes úteis

	pacman -S network-manager-applet networkmanager wpa_supplicant wireless_tools dialog

# Configuração de rede

	echo artix > /etc/hostname

nvim /etc/hosts

	127.0.0.1        localhost
	::1              localhost
	127.0.1.1        myhostname.localdomain  myhostname

Carregador de inicialização

	pacman -S grub efibootmgr
	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
	grub-mkconfig -o /boot/grub/grub.cfg

# Reiniciar o sistema

	exit
	umount -R /mnt
	sudo reboot

# Conceder acesso root ao nosso usuário

	EDITOR=nvim visudo

# Adicionar o nome de usuário ao arquivo Sudoers

	su root

	root		ALL=(ALL:ALL) ALL
	USERNAME	ALL=(ALL:ALL) ALL

# Fazer login com o usuário recém-criado

	su - USERNAME

# Diretório HOME

	pacman -S xdg-user-dirs
	xdg-user-dirs-update

Diretório para capturas de tela

	mkdir ~/Pictures/Screenshots

# Configuração pós-instalação

	git clone https://github.com/euberfs/arch_i3.git
	cd artix_i3 
	sudo sh apps_pacman.sh

Backup da configuração padrão do i3

	cp ~/.config/i3/config ~/Documents/ && rm -rf ~/.config/i3/config

Dotfiles

	cp -r ~/artix_i3/.dotfiles ~/
	cd .dotfiles && stow .

# Reiniciar o sistema

	sudo reboot

# Adicionar asteriscos quando digitar sua senha

	echo 'Defaults pwfeedback'|sudo tee /etc/sudoers.d/0pwfeedback

# Atualizar

	sudo pacman -Syyu --noconfirm && clear

# Corrigir o erro "unable to lock database" no Arch Linux

	sudo rm /var/lib/pacman/db.lck

# Remover pacotes órfãos

	sudo pacman -Rns $(pacman -Qtdq) --noconfirm

# Se houver erro "externally-managed-environment"

	sudo rm /usr/lib/pythonXXX/EXTERNALLY-MANAGED

# Problemas de som com múltiplas placas

	sudo vim /etc/modprobe.d/alsa-base.conf

# Adicionar este conteúdo em alsa-base.conf (troca as placas de som, então 1 é padrão)
options snd-hda-intel index=1,0l

# Habilitar áudio

	sudo nvim /etc/asound.conf

	defaults.pcm.card 1
	defaults.pcm.device 0
	defaults.ctl.card 1

	amixer sset Master unmute

# Atualizar fontes

	fc-cache -f -v

# Remover pacotes órfãos

	pacman -Rns $(pacman -Qtdq) --noconfirm

# Snapshot com Timeshift

	timeshift --create --comments "First Backup" --tags D

# Atualizar

	pacman -Syyu --noconfirm && clear

# Tema e ícones

nord

	mkdir -p $HOME/.local/share/{themes,icons} 
	git clone https://github.com/EliverLara/Nordic.git ~/Downloads/Nordic
 	cp -r $HOME/Downloads/Nordic $HOME/.local/share/themes/

gruvbox

	mkdir -p $HOME/.local/share/{themes,icons} 
	git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk.git ~/Downloads/Gruvbox
 	cp -r $HOME/Downloads/Gruvbox/themes/Gruvbox-Material-Dark $HOME/.local/share/themes
	 -r $HOME/Downloads/Gruvbox/icons/Gruvbox-Material-Dark $HOME/.local/share/icons/Gruvbox_icons

dracula

	mkdir -p $HOME/.local/share/{themes,icons} 
	git clone https://github.com/dracula/gtk.git ~/Downloads/Gruvbox
 	cp -r $HOME/Downloads/Dracula $HOME/.local/share/themes/

	git clone https://github.com/m4thewz/dracula-icons.git ~/Downloads/Dracula_icons
	cp -r $HOME/Downloads/Dracula_icons $HOME/.local/share/icons/

# Impressora HP

	sudo systemctl enable cups.service
	sudo systemctl start cups.service
	sudo hp-setup -i
	
# polybar  
- [GitHub](https://github.com/polybar/polybar): Uma barra de status altamente personalizável para o sistema X Window.
    
Clone o repositório de temas da polybar e execute o script de instalação.

```bash
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes && chmod +x setup.sh
./setup.sh
```

# yay  
Clone o repositório do yay, compile e instale o pacote, e remova o diretório temporário.

```bash
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si && cd
rm -r yay
```

Aplicativos
Alguns pacotes úteis para instalar, como espanso, taskwarrior, dropbox, entre outros.

```bash
espanso-x11
taskwarrior-tui
dropbox
timer-bin
lf-git
sc-im
networkmanager-dmenu
perl-image-exiftool
```

# bluetooth

```bash
sudo systemctl start bluetooth
sudo systemctl enable bluetooth
systemctl status bluetooth
bluetoothctl
```
        power on: Liga o adaptador Bluetooth.
        agent on: Habilita o agente para pareamento.
        scan on: Inicia a varredura para dispositivos Bluetooth disponíveis.
        pair <MAC_ADDRESS>: Faz o pareamento com um dispositivo.
        connect <MAC_ADDRESS>: Conecta-se a um dispositivo.
        trust <MAC_ADDRESS>: Confia no dispositivo para futuras conexões automáticas.
        exit: Sai do bluetoothctl.

Adaptador Bluetooth não encontrado: Certifique-se de que o módulo do kernel Bluetooth esteja carregado:

```bash
sudo modprobe btusb
```

Erro ao parear ou conectar: Às vezes, reiniciar o serviço Bluetooth pode resolver problemas de pareamento.

```bash
sudo systemctl restart bluetooth
```

# tmux  
Clone o gerenciador de plugins do Tmux e use o comando específico para carregar as configurações.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
.tmux.conf
tmux source ~/.tmux.conf
```

Pressione `prefix + I` para buscar o plugin.

# fish  
Defina o Fish como o shell padrão, configure o tema e instale o gerenciador de plugins. 

```bash
chsh -s $(which fish)
fish_config
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

Plugins Fisher sugeridos:

```bash
fisher install jorgebucaran/nvm.fish
fisher install jorgebucaran/autopair.fish
fisher install PatrickF1/fzf.fish
fisher install edc/bass
fisher install decors/fish-colored-man
fisher install budimanjojo/tmux.fish
```

Instale o Oh My Fish:

```bash
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

Plugins OMF:

```bash
omf install archlinux
```

# fzf  
Clone o fzf e instale-o.

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/fzf && ~/.config/fzf/install
```

Configure o tema "dracula" no Fish (execute uma vez):

```bash
set -Ux FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
```

# Vim-Instant-Markdown  
Instale o plugin de Markdown instantâneo para o Vim usando npm.

```bash
sudo npm -g install instant-markdown-d
```

# lf  
Clone o repositório e compile o aplicativo.

```bash
git clone https://github.com/NikitaIvanovV/ctpv
cd ctpv && make
sudo make install
```

# Podgrab  
Clone e instale o Podgrab para gerenciar podcasts.

```bash
git clone https://github.com/akhilrex/podgrab.git
cd podgrab && make
sudo make install
```

# Quick Note  
Clone o repositório e instale o aplicativo para anotações rápidas.

```bash
git clone https://github.com/tomcarbon/Quick-Note.git
cd Quick-Note && make
sudo make install
```

# npm  
Instale pacotes npm globalmente, como wikit, tldr e nativefier.

```bash
sudo npm install -g wikit tldr nativefier
```

# qgis  
Instale o QGIS usando Flatpak.

```bash
flatpak install --from https://dl.flathub.org/repo/appstream/org.qgis.qgis.flatpakref
```

# Virtualbox  
Carregue o módulo do VirtualBox, instale o pacote de extensões, e adicione o usuário ao grupo necessário.

```bash
sudo modprobe vboxdrv
vboxmanage -v | cut -dr -f1
wget https://download.virtualbox.org/virtualbox/7.0.12/Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack
sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack
sudo usermod -aG vboxusers $USER
groups $USER
```

# Joplin  
Instale o Joplin na versão CLI ou GUI e configure a sincronização com o Dropbox.

```bash
NPM_CONFIG_PREFIX=~/.config/joplin npm install -g joplin && sudo ln -s ~/.config/joplin/bin/joplin /usr/bin/joplin
nvm install 20.13.0
nvm use 20.13.0
sudo pacman -S fuse2
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
```

**Sincronização com Dropbox**

```bash
:config sync.target 7
:sync
:config editor nvim
```

# ncmpcpp and mpd  
Crie os diretórios necessários para o ncmpcpp e o mpd, e configure o serviço do mpd.

```bash
mkdir -p ~/.config/{ncmpcpp,mpd}
mkdir -p ~/.config/mpd/playlists
mpc update
sudo systemctl enable mpd
sudo systemctl start mpd
sudo nano /etc/systemd/system/mpd.service
```

# newsboat  
Instruções para encontrar o ID de um canal do YouTube para adicionar no Newsboat.

```bash
https://takeout.google.com/
```

# mutt  
Configure pastas e arquivos para o cliente de e-mails Mutt.

```bash
mkdir -p ~/.config/mutt/themes
mkdir -p ~/.config/mutt/cache/{headers,bodies} && touch ~/.config/mutt/certificates
cp ~/.dotfiles/mutt/muttrc ~/.config/mutt/
```

# cheet  
Clone o repositório e torne o arquivo executável.

```bash
git clone https://github.com/aeghn/cheet.git
chmod +x $HOME/cheet/cheet
```

# Firefox  
Sugestões de temas e extensões para instalar no Firefox.

```bash
https://addons.mozilla.org/es/firefox/addon/gruvbox-dark-theme/
https://addons.mozilla.org/es/firefox/addon/nord-firefox/
https://addons.mozilla.org/en-US/firefox/addon/dracula-dark-colorscheme/
https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
https://addons.mozilla.org/en-US/firefox/addon/decentraleyes/
https://addons.mozilla.org/en-US/firefox/addon/istilldontcareaboutcookies/
https://addons.mozilla.org/en-US/firefox/addon/styl-us/
```

# GitHub  
Comandos para inicializar um repositório Git, adicionar arquivos, fazer commit e enviar ao GitHub.

```bash
cd $HOME/.dotfiles
git init
git add .
git commit -m "Primeiro commit"
git remote add origin https://github.com/USER/DIR.git
git branch -M main
git push -u origin main
```

**Atualização**

```bash
cd /path/to/your/directory
git status
git add .
git commit -m "Description of changes"
git pull origin main  # Opcional
git push origin main
```

# Sync dotfiles with dropbox  
Instruções para iniciar o Dropbox e sincronizar os arquivos de configuração com scripts automatizados.

```bash
dropbox start -i
systemctl --user enable dropbox
systemctl --user start dropbox
chmod +x $HOME/.local/bin/apps.sh
chmod +x $HOME/.local/bin/sync_dotfiles.sh
crontab -e
*/5 * * * * /bin/bash $HOME/.local/bin/apps.sh && /bin/bash $HOME/.local/bin/sync_dotfiles.sh
systemctl start cronie
```

# zsh  
Defina o Zsh como shell padrão, instale o Oh My Zsh e configure temas e plugins.

```bash
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Configurações:

```bash
export HISTFILE=~/.config/zsh/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
```

Temas e plugins:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.config/zsh/oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax
