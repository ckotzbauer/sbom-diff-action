FROM anchore/syft:v0.70.0@sha256:39d175040c9ad24d7b53b15b1d49f972f75a1c012bac1df6fe4fbd2bc29b1496 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
