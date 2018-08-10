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
    eval "$(ssh-agent -s)"
    chmod 600 ./deploy_key
    echo -e "Host 35.227.98.126\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
    ssh-add ./deploy_key
    ssh -i ./deploy_key travis@35.227.98.126 /var/www/html/affiliates_connect_demo/travis/deploy.sh

else

    echo "No deploy script for branch '$TRAVIS_BRANCH'"

fi
