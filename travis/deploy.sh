#!/bin/bash

# print outputs and exit on first failure
set -xe

if [ $TRAVIS_BRANCH == "master" ] ; then

    # setup ssh agent, git config and remote
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/travis_rsa
    ls

elif [ $TRAVIS_BRANCH == "dev" ] ; then

    # setup ssh agent, git config and remote
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/travis_rsa
    ls

elif [ $TRAVIS_BRANCH == "travis" ] ; then

    ssh -o "StrictHostKeyChecking no" -q travis@35.227.98.126 exit && echo $?
    ls

else

    echo "No deploy script for branch '$TRAVIS_BRANCH'"

fi
