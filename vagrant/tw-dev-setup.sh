#!/bin/bash

# Variables.
TW_DIR='/tmp/trainingwheels'

echo ''
echo '======================================================================='
echo 'Setting up the Training Wheels developer packages...'
cd $TW_DIR/vagrant
ansible-playbook -c local --user=root dev-setup.yml
