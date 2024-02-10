FROM anchore/syft:v0.104.0@sha256:aeb052d18121587de9138ca715fc3207ef86358a56bd49ebd2d3ba27169c09d1 as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
