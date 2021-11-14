#!/bin/bash

Wait for database to be ready
until nc -z -v -w30 $DATABASE_HOST $DATABASE_PORT; do
 echo 'Waiting for PostgreSQL...'
 sleep 1
done
echo "PostgreSQL is up and running!"

# If the database exists, migrate. Otherwise setup (create and migrate)
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
# bundle exec rake db:migrate
echo "PostgreSQL database has been created & migrated!"

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid

bundle exec rails s -b 0.0.0.0 -p 3000