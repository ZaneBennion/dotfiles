# Keyd config

Install and start keyd (e.g `sudo systemctl enable keyd --now`)

Put the following in /etc/keyd/default.conf:
```
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(control, esc)

# Remaps the escape key to capslock
esc = capslock

# Swap Super and ALT
# leftalt = leftmeta
# leftmeta = leftalt
```

Run `sudo keyd reload` to reload the config set.
