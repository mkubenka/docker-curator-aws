FROM alpine:3.14

RUN apk --update add \
        python3 \
        py3-pip \
    && pip install elasticsearch-curator==5.8.4 \
    && apk del py3-pip \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /code

USER nobody:nobody

COPY curator_aws.py /code/curator_aws.py

WORKDIR /code

CMD ["python", "/code/curator_aws.py"]
