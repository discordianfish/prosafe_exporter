FROM alpine:3.10
ENV VERSION=0.2.7
ENV URL="https://github.com/dalance/prosafe_exporter/releases/download/v0.2.7/prosafe_exporter-v${VERSION}-x86_64-lnx.zip"

RUN apk --no-cache add ca-certificates openssl && \
  wget -O /tmp/prosafe_exporter.zip "$URL" && \
  cd /usr/bin && \
  unzip /tmp/prosafe_exporter.zip && \
  rm /tmp/prosafe_exporter.zip

EXPOSE 9493
ENTRYPOINT [ "/usr/bin/prosafe_exporter" ]
