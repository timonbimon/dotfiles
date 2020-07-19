#!/bin/zsh

brew update
brew upgrade

# rg — ripgrep recursively searches directories for regex patterns
brew install ripgrep

# bat — A cat(1) clone with wings
brew install bat

# tldr — simplified and community-driven man pages
brew install tldr

# exa— A modern replacement for ls
brew install exa

# jump - faster fasd
brew install jump

# fzf — A command-line fuzzy finder
brew install fzf
$(brew --prefix)/opt/fzf/install

brew cleanup
