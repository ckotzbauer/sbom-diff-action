FROM anchore/syft:v1.9.0@sha256:205d527263647054b457a0622b27aa8e584351c9bae66846bbaba1e4fb0e6561 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
