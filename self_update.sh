#!/bin/bash
set -e
set -u

ANSIBLE_PLAYBOOK=`which ansible-playbook`
if [ -z $ANSIBLE_PLAYBOOK ];then
  echo ansible-playbook not found
  exit 1
fi

DIR="$( dirname "${BASH_SOURCE[0]}" )"
echo $DIR
pushd $DIR
$ANSIBLE_PLAYBOOK -i "localhost," -c local test.yml > /srv/repos/test-commit.log
popd
