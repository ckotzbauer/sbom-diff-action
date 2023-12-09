FROM anchore/syft:v0.98.0@sha256:b353bf516310fcbc86676bb20849929298034e80f15873e63da18acdf7080b4e as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
