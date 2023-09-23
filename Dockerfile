FROM anchore/syft:v0.91.0@sha256:8bd8d3d874800ab8d7b4b068ec64bdfe86e51ccbeb2d8a739afe984128021412 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
