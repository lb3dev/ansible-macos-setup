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

### Enable Firewall

```
System Preferences > Security & Privacy > Firewall > Turn On (Requires Admin)
```

### Keyboard Modifier Keys

```
System Preferences > Keyboard > Modifier Keys > Select Keyboard with dropdown > Map Options to Command, and Command to Options, click OK to save
```

When connecting off the shelf Windows ANSI keyboards,  switch the modifier keys **Command** and **Options** keys such that the physical layout of bottom left corner of the keyboard map to **Ctrl + Options + Command**

### Disable Mouse Natural Scroll

```
System Preferences > Mouse > Uncheck Scroll Direction: Natural
```

### Disable Screen Saver

```
System Preferences > Desktop & Screen Saver > Screen Saver > Uncheck Show Screen Saver after
```

### Energy Saver Off

```
System Preferences > Energy Saver > Turn display off after: Slide to Never

Check Prevent your Mac from automatically sleeping when display is off
```