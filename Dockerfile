FROM python:3.6-alpine as python-base
COPY ./ /opt/resin-sdk-python
RUN apk --update upgrade && apk add \
    gcc \
    libffi-dev \
    musl-dev \
    openssl-dev && \
    cd /opt/resin-sdk-python && pip install . && \
    pip freeze > /requirements.txt

FROM python:3.6-alpine
COPY --from=python-base /root/.cache /root/.cache
COPY --from=python-base /requirements.txt /requirements.txt
RUN pip install -r requirements.txt && rm -rf /root/.cache
