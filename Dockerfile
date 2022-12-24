FROM anchore/syft:v0.64.0@sha256:b65156161cbffed1376e23dc8aa3de6541499ae4eb2e2d29eb24cd1288ce298b as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
