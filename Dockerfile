FROM anchore/syft:v1.8.0@sha256:37552ed2e74c0b7c944501d901110076505984c312c82c06633259d492ea87e1 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
