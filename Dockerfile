FROM anchore/syft:v1.15.0@sha256:92b229ac1d84cd9627624a951e26a78333b26a5f34c9999629ba96e90751c971 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
