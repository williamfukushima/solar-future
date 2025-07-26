docker exec -u node -it n8n n8n import:workflow --input=/files/n8n-workflows/SeedDB.json
docker exec -u node -it n8n n8n import:workflow --input=/files/n8n-workflows/RequestReport.json
docker exec -u node -it n8n n8n import:workflow --input=/files/n8n-workflows/RequestReportData.json

# if you have the credentials in the local-files
if [ -f "./local-files/credentials/credentials.json" ];
then
    docker exec -u node -it n8n n8n import:credentials --input=/files/credentials/credentials.json
else
    docker exec -u node -it n8n n8n import:credentials --input=/files/credentials/credentials-template.json
fi
