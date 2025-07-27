#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo 'cloning astal'
mkdir -p /tmp/astal
git clone https://github.com/aylur/astal.git /tmp/astal
cd /tmp/astal
echo 'building astal-io'
cd /tmp/astal/lib/astal/io
meson setup build
meson install -C build
echo 'building astal3'
cd /tmp/astal/lib/astal/gtk3
meson setup build
meson install -C build
echo 'building astal4'
cd /tmp/astal/lib/astal/gtk4
meson setup build
meson install -C build
