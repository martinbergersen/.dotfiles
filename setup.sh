#!/bin/bash

# Make sure to run the script from its location
cd "`dirname "$0"`"

# Files for linking
files=(".tmux.conf" ".vimrc" ".bashrc.usr")

# Create links
for file in "${files[@]}"; do
  target="$HOME/$file"
  source_file="$(pwd)/$file"

  # Check if the file already exists in the users home folder
  if [ -e "$target" ] || [ -L "$target" ]; then
    # If it does, ask the user for confirmation to overwrite
    read -p "$target already exists. Overwrite with symlink? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      # If "yes" then overwrite file with link
      ln -sf "$source_file" "$target"
      echo "Linked $target -> $source_file"
    else
      echo "Skipping $file"
    fi
  else
    # If file not pressent, create symlink
    ln -s "$source_file" "$target"
    echo "Created link $target -> $source_file"
  fi
done

# Make sure ~/.bashrc is sourcing ~/.bashrc.usr
bashrc="$HOME/.bashrc"
source_line="[ -f ~/.bashrc.usr ] && . ~/.bashrc.usr"

if [ -f "$bashrc" ]; then
  if ! grep -Fxq "$source_line" "$bashrc"; then
    echo "Adding source line to $bashrc"
    echo -e "\n# Load personal workspace settings\n$source_line" >> "$bashrc"
  else
    echo "Sourcing line already exists in $bashrc"
  fi
fi

