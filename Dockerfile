FROM anchore/syft:v1.0.1@sha256:d49defada853900861d55491ba549ab334148d51b11f23942abecb39ea83d4db as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
