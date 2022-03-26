FROM anchore/syft:v0.42.4@sha256:8bbaebbd4bfc3fed46227eba1d49643fc1bb79b23378956f96cff4c5d69dd42b as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
