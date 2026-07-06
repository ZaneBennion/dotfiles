-- Montior wiki https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1
})

hl.monitor({
    output    = "eDP-2",
    mode      = "3840x2160@60",
    position  = "0x0",
    scale     = "2",
})

hl.monitor({
    output    = "DP-3",
    mode      = "1920x1080@144.01",
    position  = "3840x0",
    scale     = "1",
})

hl.monitor({
    output    = "DP-2",
    mode      = "preferred",
    position  = "5760x0",
    scale     = "1",
})

hl.workspace_rule({ workspace = "1", monitor = "eDP-2", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-3", default = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", default = true })
