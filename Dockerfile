FROM anchore/syft:v1.14.2@sha256:c13d29326c56d33992c3ba5ea96bf6c7eedad72e125945b53815662801b28a70 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
