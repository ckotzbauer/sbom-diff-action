FROM anchore/syft:v0.87.1@sha256:52ab5880130ed6d4c522cc9b15aee74a0115c5614e1cef2cd4c855dd493c65ae as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
