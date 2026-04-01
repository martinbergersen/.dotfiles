#!/bin/bash

# Make sure to run the script from its location
cd "`dirname "$0"`"

# 1. Create an array with files to "install"
files=(".tmux.conf" ".vimrc" ".bashrc.usr")

# 2. Loop through array and for every file
for file in "${files[@]}"; do
  target="$HOME/$file"
  source_file="$(pwd)/$file"

  # Check if the file exists in the users home folder
  if [ -e "$target" ] || [ -L "$target" ]; then
    # If it does, ask the user for confirmation to overwrite
    read -p "$target already exists. Overwrite with symlink? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      ln -sf "$source_file" "$target"
      echo "Linked $target -> $source_file"
    else
      echo "Skipping $file"
    fi
  else
    # If not, create symlink
    ln -s "$source_file" "$target"
    echo "Created link $target -> $source_file"
  fi
done

# 3. Check if ~/.bashrc is sourcing ~/.bashrc.usr
BASHRC="$HOME/.bashrc"
SOURCE_LINE="[ -f ~/.bashrc.usr ] && . ~/.bashrc.usr"

if [ -f "$BASHRC" ]; then
  if ! grep -Fxq "$SOURCE_LINE" "$BASHRC"; then
    echo "Adding source line to $BASHRC"
    echo -e "\n# Load personal workspace settings\n$SOURCE_LINE" >> "$BASHRC"
  else
    echo "Sourcing line already exists in $BASHRC"
  fi
fi

