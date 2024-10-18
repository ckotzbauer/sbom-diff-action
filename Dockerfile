FROM anchore/syft:v1.14.1@sha256:4d552afdf17f38549c130a7d3147dcaa41adee5cb82418396a74e25ca593c8d3 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
