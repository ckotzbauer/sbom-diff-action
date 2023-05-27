FROM anchore/syft:v0.82.0@sha256:d20096d5c42a8f023499a9bba80a93994609f0d5af123dfe6ff15db1c8921652 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
