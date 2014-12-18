# Karabiner
Karabiner provides a command line interface, which enables to export the configuration:
`/Applications/Karabiner.app/Contents/Library/bin/karabiner export > ~/Desktop/karabiner-import.sh`

*Warning:*
This does not load the private.xml so we also need:
`cp /karabiner/private.xml /Users/Seb/Library/Application Support/Karabiner`
