FROM anchore/syft:v0.66.1@sha256:8474b19bdee26f5982dad2ea3954d25ede696eeb76fe9ff5f590f3356d722af6 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
