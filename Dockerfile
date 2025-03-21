FROM anchore/syft:v1.21.0@sha256:eaf0517f7dcd9a29915eabb2c007dbc65b2f3f31f6e17906717e506d1d37a1c0 as syft
FROM alpine:3.21

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
