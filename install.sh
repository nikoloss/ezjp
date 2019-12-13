#!/bin/bash
cd `dirname $0`
ezjp_home=`pwd`
echo $ezjp_home

if [[ ${SHELL##*/} = "bash" ]]; then
    echo "export EZJP_HOME=\"$ezjp_home\"">>$HOME/.bash_profile
    echo ". $ezjp_home/rc/ezjp.rc">>$HOME/.bash_profile
elif [[ ${SHELL##*/} = "zsh" ]]; then
    echo "export EZJP_HOME=\"$ezjp_home\"">>$HOME/.zshrc
    echo ". $ezjp_home/rc/ezjp.rc">>$HOME/.zshrc
fi
