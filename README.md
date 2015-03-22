# docker-toolbox
Sweet container for tooling around in.

Use with handy bash function like so:
``` bash
newbox() {
    echo "Spinning up $1"
    docker run --name $1 -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${HOME}/.vimrc:/home/dev/.vimrc \
    -v ${HOME}/.vim:/home/dev/.vim \
    -v ${HOME}/.bashrc:/home/dev/.bashrc \
    -v ${HOME}/dotfiles:/home/dev/dotfiles \
    -e BOX_NAME=$1 sthysel/toolbox 
}
```
