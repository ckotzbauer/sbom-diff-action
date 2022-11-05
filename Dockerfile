FROM anchore/syft:v0.60.3@sha256:a211bfc18fba31c2eadda1d0e8e85dccb526b97e964e5be4115340aa8dc7c2be as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
