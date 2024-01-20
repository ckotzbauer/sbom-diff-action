FROM anchore/syft:v0.101.1@sha256:ea3df0f0d7b85b352911f2b4a06fd08e2f19cdc793812c8766f7813b6a1e98cb as syft
FROM alpine:3.19

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
