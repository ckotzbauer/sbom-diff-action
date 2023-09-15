FROM anchore/syft:v0.90.0@sha256:69d84e41b7efd62c0fa6978e01cde25464fa41bdad36068e1a53046e8c590588 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
