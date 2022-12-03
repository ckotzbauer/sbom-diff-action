FROM anchore/syft:v0.62.3@sha256:fa62c5f7f74880fc859e1472b804624b8226f3cb6f87ce024fb4040ad5f1bb1b as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
