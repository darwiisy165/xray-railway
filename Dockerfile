FROM alpine:latest

RUN apk add --no-cache ca-certificates bash curl unzip

RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/bin && \
    chmod +x /usr/bin/xray && \
    rm /tmp/xray.zip

COPY config.json /etc/config.json

CMD ["/usr/bin/xray", "run", "-c", "/etc/config.json"]
