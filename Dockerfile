FROM anchore/syft:v1.1.1@sha256:201752e0aa1233f7e2fbc478e3c345ac98b1613a6e0005fb26c8c3ee84d3809c as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
