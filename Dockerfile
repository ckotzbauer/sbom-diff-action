FROM anchore/syft:v0.76.0@sha256:2e78580c1e866d9afbb899f9270b377714101d1d203bd2886f31a7c0ab78e6fa as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
