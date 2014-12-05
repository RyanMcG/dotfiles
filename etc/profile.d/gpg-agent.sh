#!/bin/bash

# Start the GnuPG agent and enable OpenSSH agent emulation
gnupginf="${HOME}/.gpg-agent-info"

if pgrep -u "${USER}" gpg-agent >/dev/null 2>&1; then
    eval `cat $gnupginf`
    export GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID
else
    eval `gpg-agent -s --enable-ssh-support --daemon`
fi
