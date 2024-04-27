FROM anchore/syft:v1.3.0@sha256:93384e4f46c62cc827960f0e3323516576590811d246dd97556ebbf71112db49 as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
