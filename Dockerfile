FROM anchore/syft:v0.44.1@sha256:d5b44590062d4d9fc192455b5face4ebfd7879ec1540c939aa1766e5dcf4d5fc as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
