FROM anchore/syft:v1.12.2@sha256:ffccbc4bf4a3582b7c1d962e0359154f24b70f1810680b5b153f1f5907b2a2ab as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
