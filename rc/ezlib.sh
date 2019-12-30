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

function _gen_expect() {
    if [ ! -f $EZJP_HOME/h/$1 ]; then
        echo "No such file"
        return 1
    fi
    local i=0
    printf "spawn ">$EZJP_HOME/tmp/a.ff
    cat $EZJP_HOME/h/$1|sed 's/#.*//'|sed -n '/./p'|while read line||[ -n "$line" ]; do
        local host=`echo ${line}|awk '{print $1}'`
        local port=`echo ${line}|awk '{print $2}'`
        local user=`echo ${line}|awk '{print $3}'`
        local pass=`echo ${line}|awk '{print $4}'`
        local cmd="ssh $user@$host -p$port"
        if [[ $i>0 ]]; then
            cmd="send \"ssh $user@$host -p$port\r\""
        fi
        ((i++))
        cat<<EOF>>$EZJP_HOME/tmp/a.ff
$cmd
expect {
  "*password:*" {
    send "$pass\r"
  }
  "*yes/no*" {
    send "yes\r"
    expect "password:*"
    send "$pass\r"
  }
}
expect "*$user*"
EOF
    done
    cat $EZJP_HOME/tmp/a.ff|sed '$d'>$EZJP_HOME/tmp/ezexp.exp
    echo interact>>$EZJP_HOME/tmp/ezexp.exp
}
