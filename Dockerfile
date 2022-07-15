FROM anchore/syft:v0.51.0@sha256:833a9a25934898999419d5535e55ece68c148fca9bb8ab7d695a44d688618a24 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
