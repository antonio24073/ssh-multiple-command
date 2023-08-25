FROM alpine:latest
USER root
RUN apk update --no-cache
RUN apk add --no-cache --upgrade bash
RUN apk add --no-cache openssh-client
RUN apk add --update --no-cache sshpass
RUN mkdir -p /app
COPY src /app
RUN chmod +x /app/script.sh
# ENTRYPOINT ["ssh", "-V"]
ENTRYPOINT bash /app/script.sh