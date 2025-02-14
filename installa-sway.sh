#!/bin/bash

SCRIPT="$0"

modus_operandi() {
  cat <<EOF

Modus operandi:

  DM=ly       sh $SCRIPT
  DM=gdm      sh $SCRIPT
  DM=sddm     sh $SCRIPT
  DM=lightdm  sh $SCRIPT
  DM=lxdm     sh $SCRIPT

EOF
}

sway_config() {
  cat <<'END_OF_SWAY_CONFIG'
set $mod Mod4
set $term gnome-terminal

set $dmenu dmenu_path | wmenu | xargs swaymsg exec --
set $bmenu wofi-menu.sh

# Default wallpaper (more resolutions are available in /usr/share/backgrounds/sway/)
output * bg /usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png fill

### Input configuration
#
# Example configuration:

input * {
    xkb_layout it
    tap enabled
}

### Key bindings
#
# Basics:
#
    # Start a terminal
    bindsym $mod+Return exec $term

    # Kill focused window
    bindsym $mod+Shift+q kill

    # Start your launcher
    bindsym $mod+d exec $dmenu

    # Start your launcher
    bindsym $mod+b exec $bmenu

    # Drag floating windows by holding down $mod and left mouse button.
    # Resize them with right mouse button + $mod.
    # Despite the name, also works for non-floating windows.
    # Change normal to inverse to use left mouse button for resizing and right
    # mouse button for dragging.
    floating_modifier $mod normal

    # Reload the configuration file
    bindsym $mod+Shift+r reload

    # Exit sway (logs you out of your Wayland session)
    bindsym $mod+Shift+e exec swaynag -t warning -m "Vuoi uscire da Sway ? " -B "Sì, esci da Sway" "swaymsg exit"

#
# Workspaces:
#
    # Switch to workspace
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+0 workspace number 10
    # Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+0 move container to workspace number 10
    # Note: workspaces can have any name you want, not just numbers.
    # We just use 1-10 as the default.

    # Toggle the current focus between tiling and floating mode
    bindsym $mod+space floating toggle

#
# Status Bar:
#
# Read $(man 5 sway-bar) for more information about this section.
bar {
    position top

    # When the status_command prints a new line to stdout, swaybar updates.
    # The default just shows the current date and time.
    status_command while date +"%Y-%m-%d %X"; do sleep 1; done

    colors {
        statusline #ffffff
        background #323232
        inactive_workspace #32323200 #32323200 #5c5c5c
    }
}

include /etc/sway/config.d/*

END_OF_SWAY_CONFIG
}

case "$DM" in
"ly" | "gdm" | "sddm" | "lightdm" | "lxdm")

  cat <<EOF | sudo sh

pacman -Sy --needed $DM sway swaylock swaybg swayimg swaync waybar swayidle sway-contrib gnome-terminal dmenu wmenu wofi
systemctl enable    $DM

touch                       /usr/bin/wofi-menu.sh
chmod +x                    /usr/bin/wofi-menu.sh
cat <<END_OF_WOFI_SCRIPT >  /usr/bin/wofi-menu.sh
#!/bin/bash
wofi --show=drun
END_OF_WOFI_SCRIPT

EOF
  mkdir -p "$HOME/.config/sway/"
  sway_config >"$HOME/.config/sway/config"

  ;;
*)
  modus_operandi
  ;;
esac
