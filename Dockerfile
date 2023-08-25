# FROM ubuntu:18.04
# RUN apt-get update -y
# RUN apt-get install openssh-client -y
# RUN apt-get install sshpass -y

# FROM ictu/sshpass

FROM alpine:3.14
USER root
RUN apk update --no-cache
RUN apk add --no-cache --upgrade bash
RUN apk add --no-cache openssh-client
RUN apk add --update --no-cache sshpass
RUN mkdir -p /app
COPY src /app
RUN chmod +x /app/script.sh
# ENTRYPOINT [ "/app/script.sh" ]
# ENTRYPOINT [ "sleep infinity" ]
# ENTRYPOINT ["ssh", "-V"]
ENTRYPOINT bash /app/script.sh