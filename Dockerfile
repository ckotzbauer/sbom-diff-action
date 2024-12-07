FROM anchore/syft:v1.17.0@sha256:f1099806495b4d2300adf03887bdfb69230c36a5e077061a12ee292bcd9bfd62 as syft
FROM alpine:3.21

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
