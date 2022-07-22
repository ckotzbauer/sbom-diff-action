FROM anchore/syft:v0.52.0@sha256:3f8085b0bbd5768cecbbda359a6f4353c658082a820e394f9983ed764ec98109 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
