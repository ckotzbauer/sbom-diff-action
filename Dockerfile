FROM anchore/syft:v0.93.0@sha256:2e6a3664447e496e3c9774514ebc9637a294bbd8502ad42ca3510db414e27548 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
