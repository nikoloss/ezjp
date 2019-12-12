#!/bin/bash

function _update_ezjp() {
    echo "Checking update..."
    cd $EZJP_HOME
    local remote_id=`git ls-remote -q --heads|sed -n '/master/p'|awk '{print $1}'`
    local local_id=`git rev-parse HEAD`
    if [ "$remote_id" = "$local_id" ]; then
        echo "Congratulations!!! Nothing can be updated!"
        return
    fi
    echo "New version was found! Update? (*y/n):"
    read choice
    choice=${choice:-y}
    case $choice in
        n) echo "Fine, I will remind you later!"
           ;;
        y) git pull
           echo "Everything is up to date!"
           ;;
    esac
    cd -
}

function _gen_expect_script() {
    
}
