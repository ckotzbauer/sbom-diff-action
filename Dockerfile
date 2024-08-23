FROM anchore/syft:v1.11.1@sha256:14030cb01a9bde8aa5c0061894b48c3a164dafcdc56b457efddb76156c06dc6e as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
