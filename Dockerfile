FROM anchore/syft:v0.46.1@sha256:4f207b77c6ae042014991e0078743e5b71ae3aa9f949695a91b2c2e88bd0a057 as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
