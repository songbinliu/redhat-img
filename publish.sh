#!/bin/bash

set -x
imageId="red:v1"
tag=kubeturbo:v5.9.0
accountId=xxxxx

docker login -u unused -e none registry.rhc4tp.openshift.com:443

docker tag $imageId registry.rhc4tp.openshift.com:443/$accountId/$tag

docker push registry.rhc4tp.openshift.com:443/$accountId/$tag


