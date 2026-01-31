#!/bin/bash
component=$1
dnf install ansible -y
# ansible-pull -U https://github.com/Sowjanya-Dev-secops/ansible-roboshop-roles-tf.git -e component=$component main.yaml

REPO_URL=https://github.com/Sowjanya-Dev-secops/ansible-roboshop-roles-tf.git
REPO_DIR=/opt/roboshop/ansible
ANSIBLE_DIR=nsible-roboshop-roles-tf
mkdir -p $REPO_DIR
mkdir -p /var/log/roboshop/
cd $REPO_DIR

if [ -d $ANSIBLE_DIR ]; then
    cd $ANSIBLE_DIR
    git pull
else
    git clone $ANSIBLE_DIR
    cd $ANSIBLE_DIR

fi

ansible-playbook -e component=$component main.yaml