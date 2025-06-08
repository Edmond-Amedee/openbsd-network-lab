#!/bin/sh
# Simple management script for OpenBSD network lab
# SPDX-License-Identifier: MIT

CMD="$1"

case "$CMD" in
    create-alpine-jail)
        sh "$(dirname "$0")/infra/setup_jail_alpine.sh"
        ;;
    -h|--help|help|"" )
        echo "Usage: $0 <command>" >&2
        echo "" >&2
        echo "Available commands:" >&2
        echo "  create-alpine-jail   Install Alpine Linux in a FreeBSD jail" >&2
        exit 0
        ;;
    *)
        echo "Unknown command: $CMD" >&2
        exit 1
        ;;
esac
