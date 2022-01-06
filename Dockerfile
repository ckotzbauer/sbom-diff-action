FROM alpine:3.15

ENV SYFT_VERSION 0.34.0
COPY ./sbom_diff.sh /

RUN apk --no-cache add curl jq git && \
    wget -O syft.tar.gz https://github.com/anchore/syft/releases/download/v${SYFT_VERSION}/syft_${SYFT_VERSION}_linux_amd64.tar.gz && \
    syft_sha256='0efee88a90e46f86be62f45cdeb416d2e0734dcfebc6f4fec6b41bcbbd2645fa' && \
    echo "$syft_sha256  syft.tar.gz" | sha256sum -c - && \
    mkdir -p /usr/share/syft && \
    tar -C /usr/share/syft -oxzf syft.tar.gz && \
    ln -s /usr/share/syft/syft /usr/bin/syft && \
    rm syft.tar.gz && \
    chmod +x /sbom_diff.sh

CMD /sbom_diff.sh
