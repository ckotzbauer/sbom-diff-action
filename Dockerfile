FROM anchore/syft:v0.77.0@sha256:0135d844712731b86fab20ea584e594ad25b9f5a7fd262b5feb490e865edef89 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
