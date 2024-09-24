#!/bin/bash

# Caminhos dos arquivos
I3_CONFIG="$HOME/.config/i3/config"
FISH_CONFIG="$HOME/.config/fish/config.fish"
OUTPUT_FILE="$HOME/shortcuts.md"

# Filtra linhas e salva no arquivo de saída, excluindo linhas com "workspace"
{
    echo "# Shortcuts"
    echo "## Bindsym from i3 config:"
    grep '^bindsym' "$I3_CONFIG" | grep -v 'workspace' | sed 's/^/* /'
    echo ""
    echo "## Alias from fish config:"
    grep '^alias' "$FISH_CONFIG" | sed 's/^/* /'
} > "$OUTPUT_FILE"

echo "Shortcuts saved to $OUTPUT_FILE"
