FROM postgres:14

# Copy custom PostgreSQL configuration
COPY postgresql.conf /etc/postgresql/postgresql.conf
COPY pg_hba.conf /etc/postgresql/pg_hba.conf

ENV POSTGRES_INITDB_ARGS="--auth-host=scram-sha-256"
ENV PGDATA=/var/lib/postgresql/data

# Copy all SQL files from schema subdirectories into the init directory
COPY schema/*/*.sql /docker-entrypoint-initdb.d/