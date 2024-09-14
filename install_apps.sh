#!/bin/bash

# Define paths for the package list file and the not installed file
PACKAGE_FILE="$HOME/apps_pacman"
NOT_INSTALLED_FILE="$HOME/not_installed"

# Define color codes
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if the package list file exists
if [ ! -f "$PACKAGE_FILE" ]; then
    echo "Error: The file 'apps_pacman' was not found in the $HOME directory."
    exit 1
fi

# Update the package database
echo "Updating the package database..."
sudo pacman -Syu --noconfirm

# Clear the not installed file if it already exists
> "$NOT_INSTALLED_FILE"

# Read the package list file and try to install each package
while IFS= read -r package; do
    # Skip empty lines or comments
    if [ -z "$package" ] || [[ "$package" == \#* ]]; then
        continue
    fi

    # Check if the package is already installed
    if pacman -Q "$package" &> /dev/null; then
        echo -e "${BLUE}[DONE]${NC} Package '$package' is already installed."
    else
        # Try to install the package and redirect errors to the not installed file
        echo "Installing package: $package"
        if sudo pacman -S --noconfirm "$package" &> /dev/null; then
            echo -e "${BLUE}[DONE]${NC} Package '$package' has been installed successfully."
        else
            echo -e "${RED}[NOT_INSTALLED]${NC} Package '$package' could not be installed."
            echo "$package" >> "$NOT_INSTALLED_FILE"
        fi
    fi
done < "$PACKAGE_FILE"

echo "Installation complete."
echo "Packages that could not be installed have been listed in '$NOT_INSTALLED_FILE'."

