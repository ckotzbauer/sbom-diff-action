FROM anchore/syft:v0.97.1@sha256:abc8d4310c54b56dd1e789d5f60b8ebc43f472652b34971d4b0d0dbed7f4ebda as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
