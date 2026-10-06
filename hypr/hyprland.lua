------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1.25,
})


---------------------
---- MY PROGRAMS ----
---------------------

local mainMod    = "SUPER"
local terminal   = "ghostty"
local fileManager = "yazi"


----------------
---- WORKSPACES -
----------------

for i = 1, 9 do
    hl.workspace_rule({
        workspace = tostring(i),
        persistent = true,
    })
end


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()

    -- Wallpaper, status bar, idle daemon
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")

    hl.exec_cmd("mpd")

    -- GPG agent
    hl.exec_cmd("gpg-agent --daemon")

    -- XDG desktop portal
    hl.exec_cmd("/usr/lib/xdg-desktop-portal")

    -- Polkit authentication agent
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    -- Disable touchpad
    hl.exec_cmd(
        "hyprctl keyword 'device[asue1201:00-04f3:3125-touchpad]:enabled' false"
    )


    -- Workspace 2: ai
    hl.exec_cmd("ai", {
        workspace = 2,
    })

    -- Workspace 9: chat
    hl.exec_cmd("chat", {
        workspace = 9,
    })

    -- Workspace 1: btop
    hl.exec_cmd("ghostty -e ~/.local/bin/tmux-start", {
        workspace = 1,
    })

end)


--------------------------------
---- ENVIRONMENT VARIABLES ----
--------------------------------

hl.env("MOZ_ENABLE_WAYLAND", "1")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in   = 2,
        gaps_out  = 5,
        border_size = 0,
    },

    decoration = {
        inactive_opacity = 0.9,
        active_opacity   = 1.0,
        fullscreen_opacity = 1.0,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})


---------------------
---- KEYBINDINGS ----
---------------------

-- Terminal
hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(terminal)
)

-- Close active window
hl.bind(
    mainMod .. " + C",
    hl.dsp.window.close()
)

-- Shutdown / exit
hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && " ..
        "hyprshutdown || " ..
        "hyprctl dispatch 'hl.dsp.exit()'"
    )
)

-- File manager
hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(terminal .. " -e " .. fileManager)
)

-- Toggle floating
hl.bind(
    mainMod .. " + F",
    hl.dsp.window.float({ action = "toggle" })
)


--------------------------
---- WORKSPACE BINDS -----
--------------------------

for i = 1, 9 do
    local key = tostring(i)

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({
            workspace = i,
        })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({
            workspace = i,
        })
    )
end


-----------------------------
---- WINDOW SWAP BINDS -----
-----------------------------

hl.bind(
    mainMod .. " + SHIFT + H",
    hl.dsp.window.swap({ direction = "l" })
)

hl.bind(
    mainMod .. " + SHIFT + L",
    hl.dsp.window.swap({ direction = "r" })
)

hl.bind(
    mainMod .. " + SHIFT + K",
    hl.dsp.window.swap({ direction = "u" })
)

hl.bind(
    mainMod .. " + SHIFT + J",
    hl.dsp.window.swap({ direction = "d" })
)

hl.bind(
    mainMod .. " + F",
    hl.dsp.window.fullscreen()
)
---------------------------
---- BRIGHTNESS BINDS ----
---------------------------

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +5%")
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-")
)


----------------------
---- AUDIO BINDS ----
----------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.0"
    )
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    )
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    )
)


------------------------
---- TOUCHPAD TOGGLE ----
------------------------

hl.bind(
    "XF86TouchpadToggle",
    hl.dsp.exec_cmd(
        "~/.config/hypr/scripts/toggle_touchpad.sh"
    )
)


-----------------------
---- SCREENSHOT -------
-----------------------

-- Print:
-- Select an area with slurp, then open it in satty.

hl.bind(
    "Print",
    hl.dsp.exec_cmd(
        "grim -g \"$(slurp -b 00000080 -c 000000FF -s 00000000)\" - | satty --filename -"
    )
)


----------------
---- OCR -------
----------------

hl.bind(
    mainMod .. " + SHIFT + T",
    hl.dsp.exec_cmd(
        "grim -g \"$(slurp -b 00000080 -c 000000FF -s 00000000)\" /tmp/ocr.png && " ..
        "tesseract /tmp/ocr.png stdout -l ind+eng | wl-copy"
    )
)


---------------------
---- APPLICATIONS ---
---------------------

-- ALT + SPACE -> fuzzel
hl.bind(
    "ALT + SPACE",
    hl.dsp.exec_cmd("fuzzel")
)

-- SUPER + L -> hyprlock
hl.bind(
    mainMod .. " + L",
    hl.dsp.exec_cmd("hyprlock")
)

-- SUPER + SHIFT + C -> hyprpicker
hl.bind(
    mainMod .. " + SHIFT + C",
    hl.dsp.exec_cmd("hyprpicker -a")
)


-- ---------------------
-- ---- CLIPBOARD -----
-- ---------------------
--
-- -- SUPER + V
-- -- cliphist -> fuzzel -> clipboard
--
-- hl.bind(
--     mainMod .. " + V",
--     hl.dsp.exec_cmd(
--         "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
--     )
-- )
--
--
--------------------------
---- WINDOW RULES --------
--------------------------

-- Satty:
-- floating
-- centered
-- 80% monitor width
-- 80% monitor height

hl.window_rule({
    name = "pengaturan-satty",

    match = {
        class = "com.gabm.satty",
    },

    float  = true,
    center = true,

    size = {
        "monitor_w*0.8",
        "monitor_h*0.8",
    },
})
