FROM anchore/syft:v1.2.0@sha256:6e70eb6e34380ae2e9397f7dbe1b0e1e329a53e71b18fc3b1d2089e367fc114a as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
