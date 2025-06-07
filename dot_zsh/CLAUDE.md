# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a comprehensive zsh shell configuration repository that provides a professional development environment setup for macOS. The configuration uses modern zsh tools and practices to create an efficient shell environment.

## Key Architecture Components

### Plugin Management
- **antidote** manages zsh plugins and themes (`.zsh_plugins.txt` contains the plugin list)
- Generated plugin loader at `.zsh_plugins.zsh` (do not edit directly)
- To regenerate plugins: `antidote bundle < .zsh_plugins.txt > .zsh_plugins.zsh`

### Configuration Structure
- **`.zshrc`** - Main configuration file with comprehensive shell setup
- **`.zshenv`** - Environment variables (loaded for all shells)
- **`.zprofile`** - Login shell configuration
- **`.p10k.zsh`** - Powerlevel10k prompt theme configuration
- **`.p10k.mise.zsh`** - Custom mise integration for prompt

### Development Tools Integration
- **mise** (formerly rtx) for runtime version management
- **Maven** with custom aliases and JVM configuration
- **Git** with hub integration and custom workflows
- **Neovim** as primary editor with multiple config switching
- **Docker** with carapace completion integration
- **Homebrew** for package management

### Completion System
- Custom completions in `my_completions/` directory
- Cached completions in `.zcompcache/`
- Completion dump file `.zcompdump` (regenerated automatically)

## Important Files to Understand

- **`.zshrc:1-50`** - Environment detection and early setup
- **`.zshrc:100-200`** - Plugin loading and antidote configuration  
- **`.zshrc:300-400`** - Development tool integrations (mise, maven, etc.)
- **`.zshrc:500-600`** - Custom functions and aliases
- **`.p10k.mise.zsh`** - Custom prompt segment for displaying mise tool versions

## Development Environment Features

### Work/Personal Context Switching
Configuration adapts based on hostname detection for OC Tanner work environment vs personal use.

### Tool Version Management
Uses mise for managing Node.js, Python, Java, and other runtime versions with automatic project-based switching.

### Vi Mode Configuration
Advanced vi-mode setup with custom keybindings and prompt indicators.

## Common Modifications

When editing this configuration:
1. **Adding plugins**: Update `.zsh_plugins.txt` then regenerate with antidote
2. **Custom completions**: Add to `my_completions/` directory
3. **Environment variables**: Add to `.zshenv` for global scope or `.zshrc` for interactive shells
4. **Aliases/functions**: Add to the appropriate section in `.zshrc`
5. **Prompt customization**: Modify `.p10k.zsh` or `.p10k.mise.zsh`

## File Relationships

- `.zsh_plugins.txt` → generates → `.zsh_plugins.zsh` (via antidote)
- `.zshrc` sources `.zsh_plugins.zsh` and `.p10k.zsh`
- Custom completions are loaded from `my_completions/`
- Session data stored in `.zsh_sessions/`