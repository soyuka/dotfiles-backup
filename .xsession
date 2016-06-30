# dkms i3lock (copy paste from man)
#alias lock='i3lock -n -u -i ~/.config/i3/i3lock.png'

# Disable bell
xset -b

xrdb -merge .Xresources
xmodmap .Xmodmap
sh .screenlayout/home.sh

# xautolock -time 5 -locker lock
xautolock -time 20 -locker "systemctl hibernate"

echo "Starting at $(date)"  >> ~/.config/i3/log
exec /usr/bin/i3 -V >> ~/.config/i3/log
