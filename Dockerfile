FROM anchore/syft:v0.92.0@sha256:981086797ad3cb1be49d763ffaa50f2bd558c354358112f46283dd3bf8cb0c75 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
