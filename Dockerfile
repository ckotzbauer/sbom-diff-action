FROM anchore/syft:v0.102.0@sha256:fbbdb5f60a9db9400d49801bf70b19c29ac054b370dbccf538399918bbdf38a7 as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
