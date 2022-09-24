FROM anchore/syft:v0.57.0@sha256:5619c97dc7da152ab07907186206b53c72747458dbc041f85bba8fa0bdbda557 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
