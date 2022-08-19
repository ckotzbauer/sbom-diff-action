FROM anchore/syft:v0.54.0@sha256:fbb845540ae83d3daa34d3a58f362bf9b8dff7707163f1089aadc557dbcabb1c as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
