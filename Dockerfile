FROM anchore/syft:v1.20.0@sha256:b46e597614ddc78621e560af3fabf9346e35462ea1c886a38b30bcc7ca601a73 as syft
FROM alpine:3.21

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
