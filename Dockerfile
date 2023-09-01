FROM anchore/syft:v0.89.0@sha256:f630f2123432d78fedba093f32e84debbdb47c53c1f4e261dc01b90c674ba46a as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
