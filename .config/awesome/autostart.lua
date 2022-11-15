local awful = require("awful")

local programs = {
    os.getenv("HOME") .. "/.config/picom/start.sh",
    os.getenv("HOME") .. "/.screenlayout/monitor.sh",
    "setxkbmap -option ctrl:swapcaps"
}

for _, program in ipairs(programs) do
    awful.spawn(program)
end
