FROM anchore/syft:v0.55.0@sha256:42ede68d8a8762e42715692221a212cba262ce3a252ed962abf3d44ce3e68a52 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
