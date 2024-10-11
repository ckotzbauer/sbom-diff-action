FROM anchore/syft:v1.14.0@sha256:f73604d3dc671f09772684b45f35b6646022f0ace6dff42d18fe4c528c098918 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
