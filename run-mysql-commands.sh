#!/usr/bin/env bash

mysql=("mysql" "--host=${MYSQL_HOST}" "--port=${MYSQL_PORT}")

for f in /docker-entrypoint-initdb.d/*; do
    case "${f}" in
        *.sh)  echo "$0: running ${f}"; . "${f}" ;;
        *.sql) echo "$0: running ${f}"; "${mysql[@]}" < "$f" && echo ;;
        *)     echo "$0: ignoring ${f}" ;;
    esac
    echo
done
