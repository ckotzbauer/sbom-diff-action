FROM anchore/syft:v1.5.0@sha256:7e622b5d92a6ec0727fb4bd48046b644f459c33b54e9ea9025a764d324177cd2 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
