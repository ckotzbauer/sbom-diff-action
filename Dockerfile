FROM anchore/syft:v0.99.0@sha256:07d598b6a95280ed6ecc128685192173a00f370b5326cf50c62500d559075e1d as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
