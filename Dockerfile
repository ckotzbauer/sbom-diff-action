FROM anchore/syft:v0.48.1@sha256:78421757823e55a1dd6f4c1e00f9754b41f714e3b2f2cd8aed04279fa84e75c7 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
