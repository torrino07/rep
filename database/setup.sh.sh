#!/bin/bash
set -e  # Exit immediately if a command fails

# Database connection settings
DB_HOST="localhost"
DB_PORT="5432"
DB_USER="postgres"
DB_NAME="trading"
DB_PASSWORD="posgres"

# Export password so psql can use it without prompting
export PGPASSWORD="$DB_PASSWORD"

# Wait until PostgreSQL is ready to accept connections
until pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER; do
  echo "⏳ Waiting for PostgreSQL..."
  sleep 2
done

# Create the database if it doesn't exist
echo "🔧 Creating database '$DB_NAME' if it doesn't exist..."
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d postgres -tc "SELECT 1 FROM pg_database WHERE datname = '$DB_NAME'" | grep -q 1 || \
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d postgres -c "CREATE DATABASE $DB_NAME"

# List of SQL files to run in order
declare -a ordered_sql_files=(
  "/docker-entrypoint-initdb.d/01-list-database.sql"
  "/docker-entrypoint-initdb.d/02-create-roles.sql"
  "/docker-entrypoint-initdb.d/03-create-schema.sql"
  "/docker-entrypoint-initdb.d/04-create-users.sql"
  "/docker-entrypoint-initdb.d/05-populate-users.sql"
)

# Execute each SQL file
for sql_file in "${ordered_sql_files[@]}"; do
  if [ -f "$sql_file" ]; then
    echo "📄 Executing $sql_file..."
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -f "$sql_file"
  else
    echo "⚠️ File not found: $sql_file"
  fi
done

echo "✅ Schema initialized."
