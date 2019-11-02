#!/bin/bash

source /root/.bashrc

if [[ ! -e /root/.aws/config ]]; then
    mv /root/.aws/config.default /root/.aws/config
fi

if [[ ! -e /root/.aws/credentials ]]; then
    mv /root/.aws/credentials.default /root/.aws/credentials
    sed -i "s/<access-key>/${AWS_ACCESS_KEY_ID}/g" /root/.aws/credentials
    sed -i "s/<secret-key>/${AWS_SECRET_ACCESS_KEY}/g" /root/.aws/credentials
fi
