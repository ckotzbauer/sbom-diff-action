FROM anchore/syft:v0.50.0@sha256:5184b9ef92522f3e187d81b2a2c745e85b257bab46ff3f90c4c2f30814d1d420 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
