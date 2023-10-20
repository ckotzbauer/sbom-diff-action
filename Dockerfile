FROM anchore/syft:v0.94.0@sha256:fc6fc91abc1d974f2e73041f375c1737d9fbb829594684ac4d72fc04dbd012ed as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
