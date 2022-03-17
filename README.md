# dotfiles
Steal anything you want.

Font: https://github.com/supercomputra/SF-Mono-Font


Backup GNOME settings:
```
dconf dump / > saved_settings.dconf
```

Restore:
```
dconf load / < saved_settings.dconf
```

Enable gnome improvements extensions (after `stow gnome` and GNOME reload)

```
gnome-extensions enable improvements
```
