#!/bin/bash

key="$1"

hideDesktop () {
    defaults write com.apple.finder CreateDesktop false
    killall Finder
    osascript -e 'display notification "Desktop is disabled" with title "quickHide.sh" sound name "Sound"'
}

showDesktop () {
    defaults write com.apple.finder CreateDesktop true
    killall Finder
    osascript -e 'display notification "Desktop is enabled" with title "quickHide.sh" sound name "Sound"'
}

hideAllIcons () {
    chflags hidden ~/Desktop/*
    osascript -e 'display notification "Desktop icons hidden" with title "quickHide.sh" sound name "Sound"'
}

showAllIcons () {
    chflags nohidden ~/Desktop/*
    osascript -e 'display notification "Desktop icons are displayed" with title "quickHide.sh" sound name "Sound"'
}

case $key in
    -disable)
    hideDesktop
    ;;
    -enable)
    showDesktop
    ;;
    -hide)
    hideAllIcons
    ;;
    -show)
    showAllIcons
    ;;
    -ph)
    chflags hidden ~/Desktop/$2
    ;;
    -ps)
    chflags nohidden ~/Desktop/$2
    ;;
esac
