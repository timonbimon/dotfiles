#!/bin/zsh

brew update
brew upgrade

# starship.rs - cross-shell prompt
brew install starship

# rg — ripgrep recursively searches directories for regex patterns
brew install ripgrep

# fd — a simple, fast and user-friendly alternative to find
brew install fd

# hyperfine - A command-line benchmarking tool
brew install hyperfine

# dust - a more intuitive version of du
brew install dust

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
