FROM anchore/syft:v1.22.0@sha256:b7b38b51897feb0a8118bbfe8e43a1eb94aaef31f8d0e4663354e42834a12126 as syft
FROM alpine:3.21

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
