# docker-toolbox
Sweet container for tooling around in

use with handy bash function like so:
``` bash
newbox() {
    docker run --name $1 --volumes-from=volume_container -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e BOX_NAME=$1 sthysel/toolbox
}
```
