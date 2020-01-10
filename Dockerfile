FROM mcr.microsoft.com/azure-cli as runtime
LABEL "repository"="https://github.com/elgohr/azure-login-action"
LABEL "maintainer"="Lars Gohr"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM runtime as test
RUN apk add --no-cache coreutils bats
ADD test.bats /test.bats
ADD mock.sh /usr/local/bin/az
RUN /test.bats

FROM runtime
