FROM anchore/syft:v1.10.0@sha256:4243162c3ac33d107a8d9981e2d41b7888b66f12d9bd547124644391be796763 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
