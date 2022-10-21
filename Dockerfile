FROM anchore/syft:v0.59.0@sha256:82af4efa3cd76d4424486ed1ad0bc31188e89afc529811e10bd6c1a12135c6dc as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
