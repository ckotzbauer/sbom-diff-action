FROM anchore/syft:v0.45.1@sha256:ca78c06aaee7ee3d62179d42ea061b428a8851c26eb52eb7e5c18af2df267053 as syft
FROM alpine:3.15

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
