#!/bin/bash

ANSIBLE_NOCOWS=1 ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
 -i ''${QISSMU_IP_ADDR}',' \
 -u testuser \
 --become-method="sudo" \
 --extra-vars='ansible_ssh_pass=1234 ansible_become_pass=1234' \
 -e 'ansible_python_interpreter=/usr/bin/python3' \
install-server.yml