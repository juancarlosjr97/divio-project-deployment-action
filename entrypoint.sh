#!/bin/sh -l

set -e

deployment_error () {
    echo "::set-output name=DEPLOYMENT_STATUS::failed"
    exit 1
}

deployment_successful () {
    echo "::set-output name=DEPLOYMENT_STATUS::success"
    exit 0
}

BRANCH_NAME=${GITHUB_REF##*/}
BRANCH_LIVE=$1
BRANCH_TEST=$2

pip install -r requirements.txt

if [ -z "$DIVIO_LOGIN_ACCESS_TOKEN" ] ; then
    echo "You must provide DIVIO_LOGIN_ACCESS_TOKEN environment variable in order to deploy."
    deployment_error
fi

if [ -z "$DIVIO_REMOTE_PROJECT_ID" ] ; then
    echo "You must provide DIVIO_LOGIN_ACCESS_TOKEN environment variable in order to deploy."
    deployment_error
fi

if [ "$BRANCH_NAME" != "$BRANCH_LIVE" ] && [ "$BRANCH_NAME" != "$BRANCH_TEST" ] ; then
    echo "The branch executed is not equal to the settings of the action. Make sure to check the default values of the variable 'BRANCH_LIVE' and 'BRANCH_TEST'."
    deployment_error
fi

ENVIRONMENT=$([ "$BRANCH_LIVE" = "$BRANCH_NAME" ] && echo "live" || echo "test")

if ! divio login ${DIVIO_LOGIN_ACCESS_TOKEN}; then
    deployment_error
fi

if divio project deploy $ENVIRONMENT --remote-id ${DIVIO_REMOTE_PROJECT_ID}; then
    deployment_successful
else
    deployment_error
fi
