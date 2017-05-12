#!/bin/bash

desktopHidden=$(defaults read com.apple.finder CreateDesktop)

if ($desktopHidden) then
    defaults write com.apple.finder CreateDesktop false
else
    defaults write com.apple.finder CreateDesktop true
fi

killall Finder
