FROM anchore/syft:v1.11.0@sha256:726ee9bb981507deb8cce9d57e7c8a80994ae0a59ffa95dc433aa325e0235c8a as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
