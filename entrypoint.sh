#!/bin/bash
set -e

rm -f /task/tmp/pids/server.pid

exec "$@"