FROM anchore/syft:v0.45.0@sha256:c2132b2e0c1187c012b18d95bdbcc37b5f59e77b2c08d3be782b54ba2a246efb as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
