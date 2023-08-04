FROM anchore/syft:v0.86.1@sha256:f2794d19ace079ec97defa96c4b75bdb7544ac96bf146497a7620aafa48603c6 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
