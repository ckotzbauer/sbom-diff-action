FROM anchore/syft:v0.43.2@sha256:2216fea3f5a5edae7ee7c70209f68b4aede34ceaba40aa008ce92903bd44d597 as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
