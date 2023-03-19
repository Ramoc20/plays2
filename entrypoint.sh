#!/bin/bash
set -e

if [  "${*}" == "./bin/ralls server" ]; then
./bin/rails db:create
./bin/rails db:prepare
fi


# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "${@}"