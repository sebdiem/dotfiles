#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.commandR2controlL 1
/bin/echo -n .
$cli set repeat.wait 10
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set private.swap_opening_parenthesis_and_a_f 1
/bin/echo -n .
$cli set private.map_space_with_enter 1
/bin/echo -n .
/bin/echo
