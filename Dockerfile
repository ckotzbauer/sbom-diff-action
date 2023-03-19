FROM anchore/syft:v0.75.0@sha256:14aa0288af20055886adb16628ff2cf4365f00fad94063826b59f9dd9c7ad0b4 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
