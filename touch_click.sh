sudo mkdir -p /etc/X11/xorg.conf.d
sudo touch /etc/X11/xorg.conf.d/90-touchpad.conf


# place this content in file

# Section "InputClass"
#         Identifier "touchpad"
#         MatchIsTouchpad "on"
#         Driver "libinput"
#         Option "Tapping" "on"
# EndSection
