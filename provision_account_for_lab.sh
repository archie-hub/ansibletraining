#!/bin/bash
# A quick script to provision 
# a few nodes for ansible

#<<com
USER="automation"
PASSWD="andrew"

ansible all -k -u root -m user -a \
	"user=$USER \
	password={{ '$PASSWD'| password_hash('sha512') }}"
ansible all -k -u root -m authorized_key -a \
	"user=$USER state=present \
	key={{ lookup('file', '/home/$USER/.ssh/id_rsa.pub') }}"
#com

ansible all -k -u root -m lineinfile -a \
	"path=/etc/sudoers state=present \ 
	line='$USER         ALL=(ALL)       NOPASSWD: ALL'" 
