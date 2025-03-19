#set env vars
set -o allexport; source .env; set +o allexport;

#mkdir -p ./n8n
#chmod 777 -R ./n8n

mkdir -p ./db_data;

mkdir -p ./redis_data;