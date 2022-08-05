FROM anchore/syft:v0.53.4@sha256:37e85e8efdeaabb1b6f65c5bc175b664cb05d1aaddd0d922130b8e25d6e49726 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
