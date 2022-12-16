FROM anchore/syft:v0.63.0@sha256:2d1fe42abf014cfed92015b1255b1ad41702ac7939571a6935d8979306932406 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
