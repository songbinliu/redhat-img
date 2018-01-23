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

# push image to docker hup

Login docker hub first:
```console
  docker login docker.io
```

Then build the image, and push it into docker hub.
```console
docker build -t docker.io/beekman9527/kubeturbo:redhat
docker push docker.io/beekman9527/kubeturbo:redhat
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
> Note: the auth field should be `username:password` base64 encoded. for example: "username:password" base64 encoded is "dXNlcm5hbWU6cGFzc3dvcmQ="



# Reference
[Redhat template](https://github.com/RHsyseng/container-rhel-examples/blob/master/starter/Dockerfile)
