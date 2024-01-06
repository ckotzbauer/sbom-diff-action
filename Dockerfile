FROM anchore/syft:v0.100.0@sha256:df7b07bfadff45e0135d74f22478f47b16ac6aff4e8dbd93133fcae3bbbb790d as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
