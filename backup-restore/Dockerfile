FROM minio/mc:RELEASE.2023-01-28T20-29-38Z as minio 

FROM postgres:15.1-alpine3.17

EXPOSE 5432
USER root

COPY --from=minio /usr/bin/mc /usr/bin/

RUN mkdir /home/scripts
COPY ./backup-restore.sh /home/scripts/
RUN chmod +x /home/scripts/backup-restore.sh

# ENTRYPOINT ["/home/scripts/backup-restore.sh"]
# CMD ["restore"]