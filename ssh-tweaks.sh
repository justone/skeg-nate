#!/bin/bash

echo "# Listen on IPv4" >> /etc/ssh/sshd_config
echo "AddressFamily inet" >> /etc/ssh/sshd_config

echo "    # Allow older host keys" >> /etc/ssh/ssh_config
echo "    HostKeyAlgorithms +ssh-rsa" >> /etc/ssh/ssh_config
echo "    PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/ssh_config
