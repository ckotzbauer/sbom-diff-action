FROM anchore/syft:v0.88.0@sha256:67349fede01338638d81927efd47a8587aeda9a31d750b4b0164697407ac76b7 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
