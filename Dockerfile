FROM anchore/syft:v1.13.0@sha256:673582430d66a6c1e1d158ae12b273f260bb8605c6e4623c47b2eb1c32deeb74 as syft
FROM alpine:3.20

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
