#! /bin/bash
# Ugly way to run programs as root under wayland
# by Subzer0
# run it with your program as extension

xhost si:localuser:root
sudo $1
