FROM anchore/syft:v0.72.0@sha256:f4735b4c31d4b9ad979eb650712cdcdb1156afe80c7d63653ac87439b379e468 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
