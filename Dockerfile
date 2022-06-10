FROM anchore/syft:v0.47.0@sha256:dc261fe509838d6c30433173b395e588f090ba93ff4419260092e5488a948210 as syft
FROM alpine:3.16

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
