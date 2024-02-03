FROM anchore/syft:v0.103.1@sha256:96c56b2554079d90e5fc8999278638ecca6454713fceebd26321d0698975b243 as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
