FROM anchore/syft:v0.62.0@sha256:7feecd8437f45a73d6200386e3011f70135e93e964e47d65e19a324db8db6487 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
