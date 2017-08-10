FROM python:3.6-alpine as python-base
RUN apk --update upgrade && apk add \
    gcc \
    git \
    libffi-dev \
    musl-dev \
    openssl-dev && \
    pip install git+https://github.com/nuzz/resin-sdk-python.git && \

FROM python:3.6-alpine
COPY --from=python-base /usr/local/lib/python3.6/site-packages/ /usr/local/lib/python3.6/site-packages/
