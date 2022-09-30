FROM anchore/syft:v0.58.0@sha256:b764278a9a45f3493b78b8708a4d68447807397fe8c8f59bf21f18c9bee4be94 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
