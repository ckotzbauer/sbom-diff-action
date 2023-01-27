FROM anchore/syft:v0.68.1@sha256:0c903e9410c28b9d0e803c70aecf76aa16c9e3d852a893e580da60921b537c78 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
