from __future__ import print_function

import curator
import yaml
import boto3
import os
import tempfile


def main():
    s3 = boto3.resource('s3')

    session = boto3.Session()
    credentials = session.get_credentials()

    with tempfile.NamedTemporaryFile() as temp_config, tempfile.NamedTemporaryFile() as temp_actions:
        s3.Object(os.environ['CONFIG_BUCKET'], 'curator.yml').download_fileobj(temp_config)
        temp_config.seek(0)

        config = yaml.load(temp_config)

        config['client']['aws_key'] = credentials.access_key
        config['client']['aws_secret_key'] = credentials.secret_key
        config['client']['aws_session_token'] = credentials.token

        temp_config.write(yaml.dump(config))
        temp_config.flush()

        s3.Object(os.environ['CONFIG_BUCKET'], 'actions.yml').download_fileobj(temp_actions)

        curator.run(
            temp_config.name,
            temp_actions.name,
            dry_run=bool(os.getenv('DRY_RUN', default=False))
        )

    return True

if __name__ == '__main__':
    main()
