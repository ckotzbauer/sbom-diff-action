FROM anchore/syft:v1.4.1@sha256:24feb76496d558c52a09a859de569fc71cb147d9aff01edab885accae5363150 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
