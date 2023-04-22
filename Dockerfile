FROM anchore/syft:v0.79.0@sha256:ffde5d9aa0468a9bd7761330e585a8a9050fda7ae6a5fa070a29f4a6f922088a as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
