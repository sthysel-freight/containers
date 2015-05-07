# A container for sedge, the .ssh/config maintainer

Run like so:
```
$ docker run -v ~/.ssh:/root/.ssh -v ${HOME}/dotfiles/sedge/config:${HOME}/dotfiles/sedge/config sedge -c ${HOME}/dotfiles/sedge/config
```

[Sedge is available on github from here: https://github.com/grahame/sedge](https://github.com/grahame/sedge)
