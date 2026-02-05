FROM python:3.12-alpine
# multi-stage build isnt necessary as there are no dependencies

# no pycache && no buffer: don't save temp files
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# non-privileged user
RUN adduser -D -H appuser

WORKDIR /app

# copy the server file
COPY app.py .

RUN chown -R appuser:appuser /app

# running as non-privileged user
USER appuser

EXPOSE 8080

# HEALTHCHECK: in order to keep build small, use built-in utilities
HEALTHCHECK CMD \
    sh -c 'echo -e "GET / HTTP/1.1\r\nHost: backend\r\nX-Real-IP: 1.2.3.4\r\nX-Forwarded-For: 1.2.3.4\r\n\r\n" \
           | nc backend 8080 \
           | grep -q "Hello from Effective Mobile" \
           || exit 1'

ENTRYPOINT ["python", "app.py"]

