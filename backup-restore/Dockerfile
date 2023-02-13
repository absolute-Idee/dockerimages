FROM minio/mc:RELEASE.2023-01-28T20-29-38Z as minio 

FROM postgres:15-alpine3.17

EXPOSE 5432

USER root

COPY --from=minio /usr/bin/mc /usr/bin/