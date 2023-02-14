#!/bin/bash

cd /home/scripts
PGPASSWORD=$PGPASSWORD

mc alias set k8s http://minio-1675858499.minio.svc.cluster.local:9000 $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
mc mb k8s/backup --ignore-existing


if [[ "$1" == "backup" ]]; then 
    date1=$(date +%Y%m%d-%H%M)
    mkdir pg-backup
    pg_dump -Ft -h postgres-postgresql.postgres.svc.cluster.local -p 5432 -U app1 app_db > postgres-db.tar
    echo "dump done"

    #archivation
    file_name="pg-backup-"$date1".tar.gz"
    tar -zcvf $file_name postgres-db.tar
    echo "archivation done"

    # Uploading to minios3
    mc cp pg-backup-"$date1".tar.gz k8s/backup 
    echo "Postgres-Backup-was-successful"

elif [[ "$1" == "restore" ]]; then
    mkdir pg-restore
    mc cp k8s/backup/pg-backup-"$2".tar.gz ./pg-restore
    echo "copy done"

    #unarchivation
    tar -xzf ./pg-restore/pg-backup-"$2".tar.gz
    echo "unarchieved"

    #restore
    pg_restore -Ft -h postgres-postgresql.postgres.svc.cluster.local -p 5432 -U app1 -C -d postgres < ./postgres-db.tar
    echo "restore done"
fi