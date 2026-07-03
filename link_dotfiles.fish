#!/usr/bin/env fish

if test (count $argv) -ne 1
    echo "Usage: "(status filename)" <folder>"
    exit 1
end

set folder $argv[1]
set source "$HOME/dotfiles/$folder"
set target "$HOME/.config/$folder"

if not test -d "$source"
    echo "Error: '$source' does not exist."
    exit 1
end

rm -rf "$target"
ln -s "$source" "$target"

echo "✓ Linked $target -> $source"
