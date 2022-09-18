# Minimal macOS Setup Notes (Monterey)

### Initial Setup

- Select Your Country or Region
- Written and Spoken Languages: Continue
- Connect to WiFi
- Migration Assistant: Not Now
- Sign In with Your Apple ID: Set Up Later
- Create local Computer Account
- Uncheck Enable Location Services
- Select Your Time Zone
- Analytics: Uncheck Share Mac Analytics with Apple
- Screen Time: Set Up Later
- Siri: Uncheck Enable
- Choose Your Look: Dark Mode

### Install Developer Command Line Tools

```bash
xcode-select --install
```

### Keyboard Modifier Keys

```
System Preferences > Keyboard > Modifier Keys > Select Keyboard with dropdown > Map Options to Command, and Command to Options, click OK to save
```

When connecting off the shelf Windows ANSI keyboards,  switch the modifier keys **Command** and **Options** keys such that the physical layout of bottom left corner of the keyboard map to **Ctrl + Options + Command**
