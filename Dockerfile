FROM anchore/syft:v0.65.0@sha256:9ec6dba81feb02439f6ed80c0ea586351ee42185dea37c1a2ce4b5be1ab77181 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
