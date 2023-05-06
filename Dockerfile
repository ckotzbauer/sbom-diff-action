FROM anchore/syft:v0.80.0@sha256:c53319814784f80de09b3f9504b87b6a4a24b7b1558a99d7713bf34c3174f384 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
