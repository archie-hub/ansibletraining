#!/bin/bash

ansible localhost -m user -a "name=angela uid=888 password={{ 'andrew'| password_hash('sha512') }} generate_ssh_key=yes"
ansible localhost -m user -a "name=tyrell uid=889 password={{ 'andrew'| password_hash('sha512') }} generate_ssh_key=yes"
ansible localhost -m user -a "name=darlene uid=887 password={{ 'andrew'| password_hash('sha512') }} generate_ssh_key=yes"
