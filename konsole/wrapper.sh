#!/usr/bin/env bash

# wrapper to make konsole execute open with a profile that matches system theme
# ln -s ~/.config/konsole/wrapper.sh ~/.local/bin/konsole
# also change in the application menu from plasma to ~/.local/bin/konsole,
# otherwise it points to /usr/bin/konsole

set -euo pipefail

color_scheme="$(kreadconfig6 --file kdeglobals --group 'General' --key ColorScheme 2>/dev/null || echo dark)"

if [[ "${color_scheme,,}" == *light* ]]; then 
    color="light"
else 
    color="dark"
fi

# Write to config file.
# If only launch with profile, new tabs would still fall into the config profile.
kwriteconfig6 --file konsolerc --group "Desktop Entry" --key DefaultProfile "${color}.profile"

exec /usr/bin/konsole "$@"
