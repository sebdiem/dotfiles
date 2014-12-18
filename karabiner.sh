#!/usr/bin/env bash

# Load the application and wait until it's open
open "/Applications/Karabiner.app"
sleep 2

# Load the configuration
cp ".karabiner/private.xml" "${HOME}/Library/Application Support/Karabiner"
.karabiner/karabiner-import.sh
