set -e
source ./.env

docker compose up -d --wait 

# Execute migration
PGPASSWORD=${POSTGRES_PASSWORD} psql -U ${POSTGRES_USER} -d postgres -h localhost -p ${POSTGRES_PORT} -f ./migrations/SolarFutureInitialMigration.sql
