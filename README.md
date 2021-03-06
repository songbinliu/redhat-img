# redhat-img
Docker file to generate kubeturbo container image according to redhat's requirement

# login a Redhat machine and register 
As it will install pkgs from RedHat repos, it is necessary to build this image from a RHEL machine which has registered the subscription from RedHat.
```console
subscription-manager register --auto-attach --username=<userName> --password=<passWord>
```

# build it

```console
docker build -t <mytag> .
```

# test the image
```console
sh run.sh
```

# push image to redhat registry
```console
docker login -u unused -e none registry.rhc4tp.openshift.com:443
docker tag $imageId registry.rhc4tp.openshift.com:443/$accountId/$tag
docker push registry.rhc4tp.openshift.com:443/$accountId/$tag
```

# push image to docker hub

Login docker hub first:
```console
  docker login docker.io
```

Then build the image, and push it into docker hub.
```console
docker build -t docker.io/vmturbo/kubeturbo:<tag>
docker push docker.io/vmturbo/kubeturbo:<tag>
```

### fix push error
If there is an error during push:
```console
...
dda6e8dfdcf7: Waiting 
unauthorized: authentication required
```
Then set up the credentials for docker hub manually. Add/change an item in `~/.docker/config.json`:
```json
{

	"auths": {
		"https://index.docker.io/v1/": {
			"auth": "dXNlcm5hbWU6cGFzc3dvcmQ="
		},
   
}
```
> Note: the auth field should be `username:password` [base64 encoded](https://www.base64encode.org). for example: "username:password" base64 encoded is "dXNlcm5hbWU6cGFzc3dvcmQ="


# Reference
[Redhat template](https://github.com/RHsyseng/container-rhel-examples/blob/master/starter/Dockerfile)
