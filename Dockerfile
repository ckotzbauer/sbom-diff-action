FROM anchore/syft:v0.41.4@sha256:0b186d1fa424c0c3242c59a8e5be0c01d7b983a95f5484d3a7b46f8b72294788 as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
