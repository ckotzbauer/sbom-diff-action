FROM anchore/syft:v0.71.0@sha256:7f33ef372f067e24da7bf404308801e8f59612f49710c02695276e5561312242 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
