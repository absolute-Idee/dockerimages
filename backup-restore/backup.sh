#!/bin/bash

cd /home/root
date1=$(date +%Y%m%d-%H%M)
mkdir pg-backup
PGPASSWORD=$POSTGRES_PASSWORD
pg_dumpall -h postgres-postgresql.postgres.svc.cluster.local -p 5432 -U app1 > pg-backup/postgres-db.tar
echo "dump gdone"

#archivation
file_name="pg-backup-"$date1".tar.gz"
tar -zcvf $file_name pg-backup
echo "archivation done"

# Uploading to minios3
mc alias set k8s-minio minio-1675858499.minio.svc.cluster.local rootuser rootpass123
mc cp pg-backup-"$date1".tar.gz k8s/bucket

echo "Postgres-Backup-was-successful"