FROM anchore/syft:v0.105.1@sha256:76f65522d8396d5ae3623f123a12ec849cb235a3335de450248eab8f9a3bfd2b as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
