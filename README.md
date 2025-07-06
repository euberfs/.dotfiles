# Verificar se o sistema está usando UEFI:

	ls /sys/firmware/efi/efivars

# Definir o layout do teclado

	ls -R /usr/share/kbd/keymaps

# Particionar o disco

	cfdisk /dev/sda

# Formatar e montar partições

## Sem Swap

	mkfs.fat -F 32 /dev/sda1
	mkfs.btrfs /dev/sda2
	mkfs.btrfs /dev/sda3

	mount /dev/sda2 /mnt
	mkdir /mnt/home
	mkdir /mnt/boot
	mkdir /mnt/boot/efi
	mount /dev/sda3 /mnt/home
	mount /dev/sda1 /mnt/boot
	mount /dev/sda1 /mnt/boot/efi


## Com Swap

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

	ping archlinux.org

	iwctl
	station list
	station YOURDEVICE get-networks
	station YOURDEVICE connect YOURWIFI
	PASSWORD

# Instalar o sistema base

	pacstrap /mnt base base-devel linux linux-firmware neovim git

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

	pacman -S network-manager-applet networkmanager wpa_supplicant wireless_tools

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

# Pós-instalação

	git clone https://github.com/euberfs/.dotfiles.git
	cd .dotfiles 
	sudo sh apps_pacman.sh (Edite a lista de aplicativos instalados com pacman)
	
Aplicativos

- **xorg-server**: [GitHub](https://gitlab.freedesktop.org/xorg/xserver): *Servidor X11 que fornece a interface gráfica para sistemas Unix-like.*
- **xorg-apps**: [GitHub](https://gitlab.freedesktop.org/xorg/app): *Conjunto de aplicativos relacionados ao X11.*
- **xorg-xinit**: [GitHub](https://gitlab.freedesktop.org/xorg/xinit): *Programa que inicia uma sessão X.*
- **i3**: [GitHub](https://github.com/i3/i3): *Gerenciador de janelas dinâmico para X11.*
- **xorg-xkill**: [GitHub](https://gitlab.freedesktop.org/xorg/app/xkill): *Ferramenta para fechar janelas gráficas rapidamente.*
- **xorg-xinput**: [GitHub](https://gitlab.freedesktop.org/xorg/app/xinput): *Ferramenta para configurar dispositivos de entrada em X11.*
- **base-devel**: [Arch Wiki](https://wiki.archlinux.org/title/Base): *Conjunto de ferramentas essenciais para desenvolvimento em Arch Linux.*
- **python-pipx**: [GitHub](https://github.com/pipxproject/pipx): *Ferramenta para instalar e executar aplicativos Python em ambientes isolados.*
- **fish**: [GitHub](https://github.com/fish-shell/fish-shell): *Shell interativa com recursos avançados.*
- **flatpak**: [GitHub](https://github.com/flatpak/flatpak): *Sistema de gerenciamento de pacotes para Linux.*
- **i3lock**: [GitHub](https://github.com/i3/i3lock): *Bloqueador de tela para o gerenciador de janelas i3.*
- **polybar**: [GitHub](https://github.com/polybar/polybar): *Barra de status altamente personalizável para X11.*
- **rofi**: [GitHub](https://github.com/davatorium/rofi): *Aplicativo de lançador de janelas e menus.*
- **trash-cli**: [GitHub](https://github.com/andreafrancia/trash-cli): *Interface de linha de comando para gerenciar arquivos na lixeira.*
- **lxappearance**: [GitLab](https://gitlab.com/LXDE/lxappearance): *Ferramenta para configurar temas e aparência de ambiente gráfico.*
- **python-pywal**: [GitHub](https://github.com/dylanaraps/pywal): *Gera paletas de cores a partir de imagens.*
- **alsa-firmware**: [ALSA](https://www.alsa-project.org/): *Firmware para drivers de som ALSA.*
- **iw**: [GitHub](https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iwd.git): *Ferramenta para configuração de redes sem fio.*
- **wpa_supplicant**: [GitHub](https://w1.fi/wpa_supplicant/): *Cliente WPA para conexões Wi-Fi.*
- **gping**: [GitHub](https://github.com/mazyar/gping): *Ferramenta visual para monitoramento de ping.*
- **dialog**: [GitHub](https://gitlab.com/cheusov/dialog): *Ferramenta para criar diálogos em terminal.*
- **pulseaudio**: [GitLab](https://gitlab.freedesktop.org/pulseaudio/pulseaudio): *Servidor de som para sistemas Unix-like.*
- **pavucontrol**: [GitHub](https://github.com/pavucontrol/pavucontrol): *Interface gráfica para controle do PulseAudio.*
- **bluez**: [BlueZ](http://www.bluez.org/): *Suporte Bluetooth para Linux.*
- **bluez-utils**: [BlueZ](http://www.bluez.org/): *Utilitários para gerenciar conexões Bluetooth.*
- **blueman**: [GitHub](https://github.com/bluez/bluez): *Gerenciador de Bluetooth gráfico para Linux.*
- **tlp**: [GitHub](https://github.com/linrunner/TLP): *Gerenciador de energia para laptops.*
- **tlp-rdw**: [GitHub](https://github.com/linrunner/TLP): *Configurações de modo de operação para TLP.*
- **powertop**: [GitHub](https://github.com/freedesktop/powertop): *Ferramenta para monitorar consumo de energia.*
- **geany**: [GitHub](https://github.com/geany/geany): *Editor de texto leve e IDE para várias linguagens.*
- **tgpt**: [GitHub](https://github.com/sharu725/tgpt): *Interface em linha de comando para GPT-3.*
- **github-cli**: [GitHub](https://github.com/cli/cli): *Ferramenta de linha de comando para interagir com o GitHub.*
- **acpi**: [Linux](https://www.acpi.info/): *Interface para mostrar informações sobre energia.*
- **dhcpcd**: [GitHub](https://github.com/esmil/dhcpcd): *Cliente DHCP para configuração de rede.*
- **#network-manager-applet**: *Applet para gerenciar conexões de rede em ambientes gráficos.*
- **reflector**: [GitHub](https://github.com/archlinux/reflector): *Ferramenta para otimizar espelhos do Arch Linux.*
- **kitty**: [GitHub](https://github.com/kovidgoyal/kitty): *Terminal gráfico e avançado.*
- **stow**: [GitHub](https://git.savannah.gnu.org/git/stow.git): *Gerenciador de software para organizar arquivos.*
- **curl**: [GitHub](https://github.com/curl/curl): *Ferramenta para transferências de dados com URLs.*
- **git**: [Git](https://git-scm.com/): *Sistema de controle de versão distribuído.*
- **wget**: [GNU Wget](https://www.gnu.org/software/wget/): *Ferramenta para download de arquivos da web.*
- **npm**: [GitHub](https://github.com/npm/cli): *Gerenciador de pacotes para JavaScript.*
- **scrot**: [GitHub](https://github.com/resloved/scrot): *Ferramenta para tirar screenshots no Linux.*
- **mutt**: [GitHub](https://github.com/muttmua/mutt): *Cliente de e-mail em modo texto.*
- **calc**: [GitHub](https://github.com/skyjake/calc): *Calculadora em linha de comando.*
- **tmux**: [GitHub](https://github.com/tmux/tmux): *Multiplexador de terminal.*
- **zenity**: [GitHub](https://github.com/GNOME/zenity): *Interface gráfica para scripts de shell.*
- **dmenu**: [GitHub](https://git.suckless.org/dmenu/): *Menu dinâmico para X11.*
- **feh**: [GitHub](https://feh.finalrewind.org/): *Visualizador de imagens leve para X11.*
- **cmus**: [GitHub](https://github.com/cmus/cmus): *Reprodutor de música em terminal.*
- **zathura**: [GitHub](https://github.com/pwmt/zathura): *Leitor de documentos com interface minimalista.*
- **zathura-pdf-mupdf**: [GitHub](https://github.com/pwmt/zathura-pdf-mupdf): *Plugin para visualizar PDFs no Zathura.*
- **fastfetch**: [GitHub](https://github.com/LinusDikmen/fastfetch): *Ferramenta para exibir informações do sistema.*
- **thunar**: [GitHub](https://gitlab.xfce.org/xfce/thunar): *Gerenciador de arquivos leve para XFCE.*
- **firefox**: [Mozilla](https://www.mozilla.org/firefox/): *Navegador da web de código aberto.*
- **ffmpegthumbnailer**: [GitHub](https://github.com/DevynCollierS/ffmpegthumbnailer): *Gerador de miniaturas para vídeos.*
- **picom**: [GitHub](https://github.com/yshui/picom): *Compositor para X11, substituto do compton.*
- **gnome-epub-thumbnailer**: [GitHub](https://gitlab.gnome.org/GNOME/gnome-epub-thumbnailer): *Gerador de miniaturas para arquivos EPUB.*
- **odt2txt**: [GitHub](https://github.com/LibOdt2txt/odt2txt): *Ferramenta para converter arquivos ODT em texto.*
- **newsboat**: [GitHub](https://github.com/newsboat/newsboat) *Um leitor de feeds RSS/Atom para terminais de texto.*
- **tmpmail**: [GitHub](https://github.com/sdushantha/tmpmail): *A temporary email right from your terminal written in POSIX sh.*
- **csview**: [GitHub](https://github.com/wfxr/csview): *Visualizador de arquivos CSV em formato de tabela na linha de comando.*
- **chafa**: [GitHub](https://github.com/hpjansson/chafa): *Ferramenta para converter imagens em arte ASCII no terminal.*

Backup da configuração padrão do i3

	cp ~/.config/i3/config ~/Documents/ && rm -rf ~/.config/i3/config

Criar links simbólicos de .dotfiles

	chmod +x ~/.dotfiles/links_config.sh

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
	git clone https://github.com/EliverLara/Nordic.git /tmp/Nordic
 	cp -r /tmp/Nordic $HOME/.local/share/themes/

gruvbox

	mkdir -p $HOME/.local/share/{themes,icons} 
	git clone https://github.com/TheGreatMcPain/gruvbox-material-gtk.git /tmp/Gruvbox
 	cp -r /tmp/Gruvbox/themes/Gruvbox-Material-Dark $HOME/.local/share/themes
	cp -r /tmp/Gruvbox/icons/Gruvbox-Material-Dark $HOME/.local/share/icons/Gruvbox_icons

dracula

	mkdir -p $HOME/.local/share/{themes,icons} 
	git clone https://github.com/dracula/gtk.git /tmp/Dracula
 	cp -r /tmp/Dracula $HOME/.local/share/themes/

	git clone https://github.com/m4thewz/dracula-icons.git /tmp/Dracula_icons
	cp -r /tmp/Dracula_icons $HOME/.local/share/icons/

# Impressora HP

	sudo systemctl enable cups.service
	sudo systemctl start cups.service
	sudo hp-setup -i
	
# polybar  

```bash
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git /tmp/polybar-themes
cd /tmp/polybar-themes && chmod +x setup.sh
./setup.sh
```

# yay  
- [GitHub](https://github.com/Jguer/yay): *Um ajudante do AUR escrito em Go que visa ser mais rápido e mais rico em recursos do que os ajudantes existentes.*

```bash
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay && makepkg -si
```
- **Espanso-x11**: [GitHub](https://github.com/espanso/espanso): *Espanso é um expansor de texto de código aberto para o X11.*
- **Taskwarrior-tui**: [GitHub](https://github.com/taskwarrior/taskwarrior-tui): *Uma interface de usuário de terminal para o Taskwarrior, um gerenciador de tarefas de código aberto.*
- **Dropbox**: [GitHub](https://github.com/dropbox/dropbox): *O cliente oficial do Dropbox para sincronização de arquivos.*
- **Timer-bin**: [GitHub](https://github.com/timer/timer-bin): *Um temporizador de linha de comando simples e fácil de usar.*
- **lf-git**: [GitHub](https://github.com/gokcehan/lf): *Um gerenciador de arquivos de terminal escrito em Go.*
- **sc-im**: [GitHub](https://github.com/sc-im/sc-im): *Um editor de planilhas de linha de comando altamente configurável.*
- **networkmanager**: [GitHub](https://github.com/NetworkManager/NetworkManager): *Gerenciador de conexões de rede para Linux.*
- **networkmanager-dmenu**: [GitHub](https://github.com/networkmanager/networkmanager-dmenu): *Uma interface de menu para o NetworkManager usando dmenu.*
- **perl-image-exiftool**: [GitHub](https://github.com/exiftool/exiftool): *Uma ferramenta para ler, escrever e editar metadados de arquivos de imagem.*

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

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux source ~/.tmux.conf
```

Pressione `prefix + I` para buscar o plugin.

# fish  


```bash
chsh -s $(which fish)
fish_config
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

Plugins Fisher:

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
- [GitHub](https://github.com/junegunn/fzf): *Um buscador difuso de linha de comando de propósito geral.*


```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.config/fzf && ~/.config/fzf/install
```

Configure o tema "dracula" no Fish (execute uma vez):

```bash
set -Ux FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
```

# Vim-Instant-Markdown  
- [GitHub](https://github.com/suan/vim-instant-markdown): *Renderização instantânea de Markdown para o Vim.*


```bash
sudo npm -g install instant-markdown-d
```

# lf Preview

```bash
git clone https://github.com/NikitaIvanovV/ctpv /tmp/ctpv
cd /tmp/ctpv && make
sudo make install
```

# Podgrab  
- [GitHub](https://github.com/ahmedbodi/podgrab): *Um servidor de download de podcasts escrito em Go.*

```bash
git clone https://github.com/akhilrex/podgrab.git /tmp/podgrab
cd /tmp/podgrab && make
sudo make install
```

# Quick Note  
- [GitHub](https://github.com/tomcarbon/Quick-Note/tree/master): *Aplicativo para anotações rápidas.*

```bash
git clone https://github.com/tomcarbon/Quick-Note.git /tmp/Quick-Note
cd /tmp/Quick-Note && make
sudo make install
```

# VimWiki

```bash
chmod +x ~/.config/nvim/generate-vimwiki-diary-template
```

# npm  
- [GitHub](https://github.com/npm/cli): *O gerenciador de pacotes para JavaScript, usado para instalar e gerenciar pacotes.*



```bash
sudo npm install -g wikit tldr nativefier
```
- [GitHub](https://github.com/indicative/wikit): *Aplicativo que fornece resumos rápidos de artigos da Wikipédia, facilitando o aprendizado e a pesquisa.*
- [GitHub](https://github.com/adam-p/markdown-here): *Aplicativo que resume textos longos em versões mais curtas e diretas, economizando tempo na leitura.*
- [GitHub](https://github.com/nativefier/nativefier): *Ferramenta para transformar sites em aplicativos de desktop nativos, permitindo uma experiência de uso mais integrada e fluida.*

# qgis  

```bash
flatpak install --from https://dl.flathub.org/repo/appstream/org.qgis.qgis.flatpakref
```

# Virtualbox  

```bash
sudo modprobe vboxdrv
vboxmanage -v | cut -dr -f1
wget https://download.virtualbox.org/virtualbox/7.0.12/Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack
sudo vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-7.0.12.vbox-extpack
sudo usermod -aG vboxusers $USER
groups $USER
```

# Joplin 
- [GitHub](https://github.com/laurent22/joplin): *Um aplicativo de anotações e tarefas de código aberto com capacidades de sincronização.*
 
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
mkdir -p ~/.config/{ncmpcpp,mpd}
mkdir -p ~/.config/mpd/playlists
mpc update
sudo systemctl enable mpd
sudo systemctl start mpd
sudo nano /etc/systemd/system/mpd.service
```

# newsboat  
- [GitHub](https://github.com/newsboat/newsboat): *Um leitor de feeds RSS/Atom para o console de texto.*

Instruções para encontrar o ID de um canal do YouTube para adicionar no Newsboat.

```bash
https://takeout.google.com/
```

# mutt  
- [GitHub](https://github.com/mutt/mutt): *Um pequeno, mas muito poderoso cliente de e-mail baseado em texto.*

Configure pastas e arquivos para o cliente de e-mails Mutt.

```bash
mkdir -p ~/.config/mutt/themes
mkdir -p ~/.config/mutt/cache/{headers,bodies} && touch ~/.config/mutt/certificates
cp ~/.dotfiles/mutt/muttrc ~/.config/mutt/
```

# cheet  
- [GitHub](https://github.com/cheat/cheat): *Uma ferramenta de linha de comando que permite criar e visualizar cheatsheets interativas.*

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
chmod +x $HOME/.dotfiles/scritps/sync_private_dropbox.sh
crontab -e
*/5 * * * * /bin/bash $HOME/.dotfiles/scritps/sync_private_dropbox.sh
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


