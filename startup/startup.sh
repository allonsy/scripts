#!/bin/bash

unset SSH_AGENT_PID
SSH_AUTH_SOCK_VAR=`gpgconf --list-dirs agent-ssh-socket`
export SSH_AUTH_SOCK=$SSH_AUTH_SOCK_VAR
startx
