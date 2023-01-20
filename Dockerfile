FROM anchore/syft:v0.68.0@sha256:9e229ff546a81980f789b7ec41e9003a4800ac614cd62fc13d045ba5653aa087 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
