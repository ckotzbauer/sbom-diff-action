FROM anchore/syft:v0.83.0@sha256:69fcf21cdd4c577d6949dca4d28549d19724b244dfb539509544be166b53ead3 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
