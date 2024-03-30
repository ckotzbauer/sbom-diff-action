FROM anchore/syft:v1.1.0@sha256:878a95c76e139fdcdf58aa14ba7594ad41971dfc834245501347276b600aa81e as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
