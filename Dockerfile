FROM anchore/syft:v1.19.0@sha256:bc1ae555a43011d23bb011a4f50e175fc9a5984a008a3f8f2d692b211fcacd2a as syft
FROM alpine:3.21

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
