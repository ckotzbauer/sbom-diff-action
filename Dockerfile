FROM anchore/syft:v0.74.1@sha256:768ca359e78845b35d51bd2b5ea0fd77376374044d5aaa8e9afe3dff951a7e4c as syft
FROM alpine:3.17

COPY --from=syft /syft /usr/local/bin
COPY ./sbom_diff.sh /

CMD /sbom_diff.sh
