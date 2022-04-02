FROM anchore/syft:v0.43.0@sha256:91ba44e1f5704cbb3c7c2917f458acfbb8971c014f5c2ee102f3f3314a5bcee5 as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
