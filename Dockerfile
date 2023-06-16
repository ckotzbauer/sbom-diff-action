FROM anchore/syft:v0.83.1@sha256:0f98d58b87b3bf5c4676c0d6481f9430f240ec19d39d6127e3d8a081408fe376 as syft
FROM alpine:3.18

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
