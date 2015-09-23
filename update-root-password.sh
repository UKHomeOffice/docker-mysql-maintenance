#!/usr/bin/env bash

set -e

function check_root {
    echo "Check default PW access..."
    err_txt=$(echo "SELECT 1+1;" | mysql --host=${MYSQL_HOST} --port=${MYSQL_PORT} 2>/dev/stdout)
    if [ $? -ne 0 ]; then
        echo $err_txt | grep "ERROR 1045"
        if [ $? -eq 0 ]; then
            echo "Detected, Access denied error, now attempting reset FROM default password..."
            echo "SET PASSWORD FOR 'root' = PASSWORD('$(cat ${MYSQL_PASSWORD_PATH})');" | \
                mysql --host=${MYSQL_HOST} --port=${MYSQL_PORT} --user="root" --password="${DEFAULT_PW}"
            if [ $? -ne 0 ]; then
                echo "ERROR resetting default password. Home time..."
                exit 1
            fi
        fi
    fi
}

if [ "${1}" = "bash" ]; then
    exec "$@"
fi

MYSQL_HOST=$(eval echo ${MYSQL_HOST})
MYSQL_PORT=$(eval echo ${MYSQL_PORT})

# Allow for no passwords when running mysql as root...
echo "[client]
user=root
password=$(cat ${MYSQL_PASSWORD_PATH})
">~/.my.cnf

set +e
check_root
set -e
