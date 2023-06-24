FROM anchore/syft:v0.84.0@sha256:bd5ef3acf08b5be457905430f8fcda530d907bb173bf086e4749acb41077acb1 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
