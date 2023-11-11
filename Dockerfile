FROM anchore/syft:v0.96.0@sha256:64dcff82a5bc1a0363d16c5cc45f01dcfa63e7ac25b9ebac2caef32e18827a06 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
