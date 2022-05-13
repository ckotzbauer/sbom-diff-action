FROM anchore/syft:v0.46.0@sha256:7fbdb795b5c8614c49974f88e5f0c380b1656b25403ee8e64bcad6cbc9d62bba as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
