FROM anchore/syft:v1.7.0@sha256:35372cf4e44776927f9222f620ab7dcfb78fa422685d02e10240255feee3c00c as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
