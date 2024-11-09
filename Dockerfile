FROM anchore/syft:v1.16.0@sha256:7dffd5ca0d200301839ce830a6ab85867049309e175a7d3829f008fd86dffd81 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
