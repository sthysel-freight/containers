# Jekyll container

Use:
```
sudo docker run --rm -v "$PWD:/src" sthysel/jekyll build
```

```
alias jekyll='sudo docker run --rm -v "$PWD:/src" -p 4000:4000 sthysel/jekyll'
jekyll build
jekyll serve -H 0.0.0.0
```

Daemon
```
sudo docker run -d -v "$PWD:/src" -p 4000:4000 sthysel/jekyll serve -H 0.0.0.0
```

Stolen from https://registry.hub.docker.com/u/grahamc/jekyll/
