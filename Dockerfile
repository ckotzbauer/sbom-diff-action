FROM anchore/syft:v0.74.0@sha256:5b186241c12047572d573116e6ff9305c83b2bb178d2e4ca556165e7f918c3dd as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
