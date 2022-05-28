FROM anchore/syft:v0.46.3@sha256:81d0739277bfd4ef4798c9a2004caa6da79649ea00fdf0ff0f516b66128ff91a as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
