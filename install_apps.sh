#!/bin/bash

# Define caminhos para o arquivo de lista de pacotes e para o arquivo de não instalados
PACKAGE_FILE="$HOME/.dotfiles/list_apps_pacman"
NOT_INSTALLED_FILE="$HOME/not_installed"

# Define códigos de cores
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

# Verifica se o arquivo de lista de pacotes existe
if [ ! -f "$PACKAGE_FILE" ]; then
    echo "Erro: O arquivo 'list_apps_pacman' não foi encontrado no diretório $HOME/.dotfiles."
    exit 1
fi

# Atualiza a base de dados de pacotes
echo "Atualizando a base de dados de pacotes..."
sudo pacman -Syu --noconfirm

# Limpa o arquivo de não instalados, caso já exista
> "$NOT_INSTALLED_FILE"

# Lê o arquivo de lista de pacotes e tenta instalar cada pacote
while IFS= read -r package; do
    # Ignora linhas vazias ou comentários
    if [ -z "$package" ] || [[ "$package" == \#* ]]; then
        continue
    fi

    # Verifica se o pacote já está instalado
    if pacman -Q "$package" &> /dev/null; then
        echo -e "${BLUE}[INSTALADO]${NC} O pacote '$package' já está instalado."
    else
        # Tenta instalar o pacote e redireciona erros para o arquivo de não instalados
        echo "Instalando o pacote: $package"
        if sudo pacman -S --noconfirm "$package" &> /dev/null; then
            echo -e "${BLUE}[INSTALADO]${NC} O pacote '$package' foi instalado com sucesso."
        else
            echo -e "${RED}[NÃO INSTALADO]${NC} O pacote '$package' não pôde ser instalado."
            echo "$package" >> "$NOT_INSTALLED_FILE"
        fi
    fi
done < "$PACKAGE_FILE"

echo "Instalação concluída."
echo "Os pacotes que não puderam ser instalados foram listados em '$NOT_INSTALLED_FILE'."


