# tor browser

```
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /dev/snd:/dev/snd --privileged  \
    --name torb \
    sthysel/tor
```

Stolen from https://github.com/jfrazelle/dockerfiles/tree/master/tor-browser
