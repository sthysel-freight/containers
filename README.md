A container for sedge, the .ssh/config maintainer
=================================================

```
$ docker run -v ~/.ssh:/root/.ssh -v ${HOME}/dotfiles/sedge/config:${HOME}/dotfiles/sedge/config sedge -c ${HOME}/dotfiles/sedge/config
```

https://github.com/grahame/sedge
