# Homebrew Notes for macOS

### Homebrew Website (For Installation Steps)

https://brew.sh

### Disable Analytics

```bash
brew analytics off
```

### Update Homebrew Formulae

```bash
brew update
```

### Upgrade All Existing Packages

```bash
brew upgrade
```

### Check Package Info

```bash
brew info package
```

### List Packages and Casks

```bash
brew list
```

### Install/Uninstall Formulae/Cask

```bash
brew install package
brew install --cask package

brew uninstall package
```

### Auto Uninstall Unused Dependency Packages
```bash
brew autoremove
```

### Remove Unused Files
```bash
brew cleanup
```