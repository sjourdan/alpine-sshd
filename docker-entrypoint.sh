#!/bin/sh

echo "Creating user"
adduser -D ${USER} && echo "${USER}:${PASSWORD}" | chpasswd
exec "$@"
