xrdb -merge .Xresources
xmodmap .Xmodmap
xautolock -time 20 -locker 'systemctl hibernate' &
i3
#cinnamon-session
