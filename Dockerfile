FROM anchore/syft:v0.49.0@sha256:0dac2b082015d634ff457c02a4c445901377513357e4e170847ef5bea97775f4 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
