FROM anchore/syft:v0.73.0@sha256:6a13beb5cc8eedb2a42a5b91a69a36105880a2a1fdba75cc8c4dbcd61a0eed2b as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
