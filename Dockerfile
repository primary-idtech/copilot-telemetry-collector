FROM mitmproxy/mitmproxy

COPY entrypoint.sh /entrypoint.sh
COPY telemetry.py /telemetry.py
RUN chmod +x /entrypoint.sh

EXPOSE 8080

VOLUME [ "/output" ]

CMD ["/entrypoint.sh"]
