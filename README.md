# Curator AWS [![Build Status](https://travis-ci.org/mkubenka/docker-curator-aws.svg?branch=master)](https://travis-ci.org/mkubenka/docker-curator-aws)

> Inspired by: https://hub.docker.com/r/bobrik/curator/

This is dockerized version of Elasticsearch Curator, tool to manage time-based indices with [AWS STS](http://docs.aws.amazon.com/STS/latest/APIReference/Welcome.html) support.

It was specifically created to be able to run Curator in AWS ECS Task/AWS Batch for processing large indices when 5 minutes Lambda execution limit is not enough.

## Usage

```bash
docker run --rm -e "CONFIG_BUCKET=curator-config-bucket" mkubenka/curator-aws
```

## Environment Variables

### `CONFIG_BUCKET`

*Required.*

S3 bucket with `curator.yml` and `actions.yml`.

```bash
docker run --rm -e "CONFIG_BUCKET=curator-config-bucket" mkubenka/curator-aws
```

### `DRY_RUN`

Do not actually perform the action.

```bash
docker run --rm -e "DRY_RUN=1" mkubenka/curator-aws
```
