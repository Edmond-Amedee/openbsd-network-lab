#!/bin/sh
# Simple orchestrator for jails and VMs

case "$1" in
    create-alpine-jail)
        sh "$(dirname "$0")/infra/setup_jail_alpine.sh"
        ;;
    *)
        echo "Usage: $0 {create-alpine-jail}" >&2
        exit 1
        ;;
esac
