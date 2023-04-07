FROM anchore/syft:v0.76.1@sha256:99743e1e372488f4df98e823baa4dcfdfdc1f560482506903901286753ae847c as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
