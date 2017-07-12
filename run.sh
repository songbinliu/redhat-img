#!/bin/bash

echo "run the container directly"
#docker run -v /root/songbin/kubeturbo/kubeturbo:/tmp/kubeturbo -d red:v1
docker run -v /etc/kubeturbo:/etc/kubeturb -d red:v1
