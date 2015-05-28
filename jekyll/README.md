# Jekyll containe

Use example:
```
sudo docker run --rm -v "$PWD:/src" sthysel/jekyll build
```

```
alias jekyll='sudo docker run --rm -v "$PWD:/src" -p 4000:4000 grahamc/jekyll'
jekyll build
jekyll serve -H 0.0.0.0
```
run as a background daemon:

sudo docker run -d -v "$PWD:/src" -p 4000:4000 grahamc/jekyll serve -H 0.0.0.0
