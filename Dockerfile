FROM alpine:3.14

RUN apk --update add \
        python3 \
        py3-pip \
    # https://github.com/elastic/elasticsearch-py/issues/1666
    && pip install elasticsearch==7.13.4 \
    && pip install elasticsearch-curator==5.8.4 \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /code

USER nobody:nobody

COPY curator_aws.py /code/curator_aws.py

WORKDIR /code

CMD ["python3", "/code/curator_aws.py"]
