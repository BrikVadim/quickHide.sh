#!/bin/bash

key="$1"

hideDesktop () {
    defaults write com.apple.finder CreateDesktop false
    killall Finder
}

showDesktop () {
    defaults write com.apple.finder CreateDesktop true
    killall Finder
}

hideAllIcons () {
    chflags hidden ~/Desktop/*
}

showAllIcons () {
    chflags nohidden ~/Desktop/*
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
