FROM anchore/syft:v0.84.1@sha256:1b1d190a2cc0f761861380f603f7b3489aa0aba01dc856dc9f7fae9e3673761c as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
