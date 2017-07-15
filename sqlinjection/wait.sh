#!/bin/sh

echo "Waiting for mysql"
until mysql -h db -u root; do
    >&2 echo "MySQL is unavailable - sleeping"
    sleep 1
done

>&2 echo "MySQL is up - executing command"
exec ./hello.sh
