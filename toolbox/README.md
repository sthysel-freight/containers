# docker toolbox
Sweet container for tooling around in.

Easiest way to use a toolbox container like this is to add a create utility function to .bashrc or similar:
``` bash
newbox() {
    echo "Spinning up $1"
    docker run --name $1 -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${HOME}/.vimrc:/home/dev/.vimrc \
    -v ${HOME}/.vim:/home/dev/.vim \
    -v ${HOME}/.bashrc:/home/dev/.bashrc \
    -v ${HOME}/dotfiles:/home/dev/dotfiles \
    -e HOSTNAME=$1 sthysel/toolbox 
}
```

The `newbox` bash function above links in everything relevant configured in the host. So the normal dev environment with all 
your settings and tunings are available in the container.

# Sample run

``` bash
thys@thysxps:~$ newbox tanya
Spinning up tanya
dev@tanya:~$
```
