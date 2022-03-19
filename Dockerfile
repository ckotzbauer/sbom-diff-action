FROM anchore/syft:v0.42.0@sha256:7ef0cca6aadbbf1286a4db01d4136a4856ee0a3949f7d563b7724d01f793d5cd as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
