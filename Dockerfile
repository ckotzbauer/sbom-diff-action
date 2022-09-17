FROM anchore/syft:v0.56.0@sha256:a401f44a4678148f882551ddf289ffcade7ca7be30cc5db7eb4d885ace92f45f as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
