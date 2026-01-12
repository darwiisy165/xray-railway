[span_0](start_span)FROM alpine:latest[span_0](end_span)

[span_1](start_span)RUN apk add --no-cache ca-certificates bash curl unzip[span_1](end_span)

# Download Xray langsung agar lebih stabil
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/bin && \
    [span_2](start_span)chmod +x /usr/bin/xray[span_2](end_span)

# Salin config ke direktori tujuan
[span_3](start_span)COPY config.json /etc/config.json[span_3](end_span)

# Jalankan Xray pada port yang akan dideteksi Railway
[span_4](start_span)CMD ["/usr/bin/xray", "run", "-c", "/etc/config.json"][span_4](end_span)
