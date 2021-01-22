FROM python:3.9.1

LABEL maintainer="juancarlosjr97@gmail.com"

COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
