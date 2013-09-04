#!/bin/bash

# Check if a .bash_prompt file already exists. If so and it's not ours, let's back it up
if [[ -f ~/.bash_prompt ]]; then
	if ! cat ~/.bash_prompt | grep -q "github.com/sblaurock/bash-prompt"; then
		mv ~/.bash_prompt ~/.bash_prompt.bak
	fi
fi

# Move our shiny .bash_prompt file to home directory
cp .bash_prompt ~/.bash_prompt

# Locate a profile file
if [[ -f ~/.bash_profile ]]; then
	PROFILE_SCRIPT=~/.bash_profile
elif [[ -f ~/.bash_login ]]; then
	PROFILE_SCRIPT=~/.bash_login
elif [[ -f ~/.profile ]]; then
	PROFILE_SCRIPT=~/.profile
else
	echo "Installation failed."
	exit 1
fi

# Does .bashrc exist? If not, create it
if [[ ! -f ~/.bashrc ]]; then
	touch ~/.bashrc
fi

# Does this user already call .bashrc from a profile file? If not, let's do it
if ! cat $PROFILE_SCRIPT | grep -q "\. ~/.bashrc"; then
	echo "[[ -r ~/.bashrc ]] && . ~/.bashrc" >> $PROFILE_SCRIPT
fi

# Does this users .bashrc file call .bash_prompt? If not, let's do it
if ! cat ~/.bashrc | grep -q "\. ~/.bash_prompt"; then
	echo "[[ -r ~/.bash_prompt ]] && . ~/.bash_prompt" >> ~/.bashrc
fi

# Garbage cleanup
cd ..
rm -rf bash-prompt

echo "Installation Complete: View ~/.bash_prompt for configuration options."
exit 0