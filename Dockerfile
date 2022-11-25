FROM anchore/syft:v0.62.1@sha256:5ff167f9f3c840fb619921b1bdd4b93973a58f72a61ba9934ac01d76a31d48e0 as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
