
# Docker containers

A set of possibly usefull Docker images to amuse and tool arround with.


##[bmon](bmon)
tgraf/bmon bandwidth monitor and rate estimator

bmon is a monitoring and debugging tool to capture networking related
statistics and prepare them visually in a human friendly way. It features
various output methods including an interactive curses user interface and
a programmable text output for scripting.

https://github.com/tgraf/bmon/

##[butterfly](butterfly)
Butterfly 

Butterfly is a xterm compatible terminal that runs in your browser.

https://github.com/paradoxxxzero/butterfly

##[n2048](n2048)
Curses 2048 puzzle game

http://dettus.net/n2048/

##[youtubedl](youtubedl)
Download YouTube vids

##[skype](skype)
Skype telephone box

Bundles skype

##[retroterm](retroterm)
hipster terminal

```
xhost +; docker run -it --rm  -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name=hipsterterm sthysel/retroterm
```

##[neovim](http://github.com/sthysel/docker-neovim.git)
nvimbox

##[spotify](spotify)
spotify web audio 

So much javascript

##[pandashells](pandashells)
pandashells container

This container provides the complete environment to run pandashells in.

 Building from Dockerfile
```
docker build -t sthysel/pandashells .
```

 Pull from Dockerhub
```
docker pull sthysel/pandashels
```

 Usage
```
docker run -it -v ${pwd}/data:/data sthysel/pandashells
```

Work in /data.

##[brick-browser](brick-browser)
brick-browser
Very simple browser. I mean, simple...

##[flask](flask)
Basic Flask sample app

```
 docker run -p 80:8080 --rm sthysel/flask
```

##[calibre](calibre)
Calibre book management tool

##[rebol](rebol)
Rebol Core
http://www.rebol.com/

##[miller](miller)
miller csv tool
https://github.com/johnkerl/miller

##[jenkins](jenkins)
In which you find a Docker image, hosting Jenkins with docker 
=============================================================

dawg.... heard you like docker, so we put docker in your docker.

Why ?
-----
You want a CI environment that exercises your Docker based/backed projects, and of course you want 
this in a Docker environment, on your dev machine.


Usage
-----
You have [docker](https://docs.docker.com/installation/) and [fig](http://www.fig.sh/install.html) [installed](https://github.com/muccg/ccg-devsetup) right ?

``` bash
$ fig up
```

browse to http://localhost:8080/

Setup the job, your repo should have a Dockerfile that specifies the build environment. Specify what you need to run. Below is a python example. Better yet, use fig-test.yml or similar.

``` bash
 The image to be used for this job
IMAGE=$(docker build . | tail -1 | awk '{ print $NF }')

 Build the directory to be mounted into Docker.
MNT="${WORKSPACE}/.."

 Execute the build inside Docker.
CONTAINER=$(docker run -d -v "${MNT}:/opt/project" ${IMAGE} /bin/bash -c 'cd /workspace && python setup.py')

 Attach to the container. You want to see the output.
docker attach ${CONTAINER}

 Get the exit code as soon as the container stops.
RC=$(docker wait ${CONTAINER})

 cleanup
docker rm ${CONTAINER}

 Exit with the same value as that with which the process exited.
exit ${RC}
```

Further reading
---------------
* http://dockerbook.com/
* https://github.com/jpetazzo/dind

##[p2pvc](p2pvc)
docker p2pvc
docker container for p2pvc terminal video chat.

 Usage from dockerhub
```bash
$ run.sh
```

 From scratch
```bash
$ docker build -t chat .
$ docker run -i -t --privileged chat
```

Links
-----
* https://github.com/mofarrell/p2pvc

##[common](common)
Common containers

Some of the other containers hers may inherrit fromm these.

##[node](node)
nvm (node version manager) managed node install

This container used nvm to install and maintain the contained node version.

##[sdr](sdr)
Docker SDR Toolbox
Docker container for SDR toys

The SDR dongle is typically a USB device. Run the container in priviledged mode to access the host's USB device. 

 Requirements
- A SDR USB Dongle, with antenna
- Docker and optionally fig installed on your Linux box
- This docker image

 Getting started

Fetch the image from dockerhub

```
$ docker pull sthysel/ads-sdr
```

Or clone this repo and build it locally:

```
$ docker build -t sdr .
```

 Run examples

 To see if your dongle works

```
$ docker run --privileged sdr
```

 Fire up rtl_tcp

```
$ docker run --privileged sdr
$ docker run --privileged sdr rtl_tcp
```

 Fire up dump1090

```
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name ads 
```

 Other things
```
$ docker run --privileged -P sdr ads
$ docker run -d --privileged -v /dev/bus/usb:/dev/bus/usb --name ads sthysel/ads-sdr
```


 Using [fig](http://www.fig.sh/yml.html)

``` bash
$ fig up
```

##[basemount](basemount)
A container for Illumina basemount

https://basemount.basespace.illumina.com/

Run like so:
```
$ docker run -v ${HOME}/data/ sthysel/basemount
```

##[nuhtml](nuhtml)
Container for https://validator.nu/

Run with `$ docker run --rm -it -p 666:8888 sthysel/nuhtml`

![Validator screenshot](shot.png?raw=true "Local validator.nu")

##[taskjuggler](http://github.com/sthysel/docker-taskjuggler.git)
docker-taskjuggler

Provides a taskjuggler container and helper scritp to manage tasks using taskjuggler.


 taskjuggler helper script

The helper script will download sthysel/taskjuggler if not present.
This sample will drop the generated reports in ./testrun
```
$ ./taskjuggler template.tjp -o ./testrun
```

 makefile

To build the container locally use the makefile. This will use the local user's user id
as the container user's (planner) id.

```
$ make build
$ make testrun
```

##[chirp](chirp)
Chirp radio programmer 

Used to tune my many boafengs.

##[mednafen](mednafen)
docker-mednafen

Docker container for mednafen emulator suite.

##[toolbox](toolbox)
docker toolbox
Sweet container for tooling around in.

Easiest way to use a toolbox container like this is to add a create utility function to .bashrc or similar:
``` bash
newbox() {
    echo "Spinning up $1"
    docker run --rm --name $1 -it \
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

 Sample run

``` bash
thys@thysxps:~$ newbox tanya
Spinning up tanya
dev@tanya:~$
```

##[wego](wego)
Go Weather Container

From here, https://github.com/schachmat/wego/

Be sure to change the fake API to your own.

Get your own from here: https://developer.worldweatheronline.com/

##[sedge](sedge)
A container for sedge, the .ssh/config maintainer

Run like so:
```
$ docker run -v ~/.ssh:/root/.ssh -v ${HOME}/dotfiles/sedge/config:${HOME}/dotfiles/sedge/config sedge -c ${HOME}/dotfiles/sedge/config
```

[Sedge is available on github from here: https://github.com/grahame/sedge](https://github.com/grahame/sedge)

##[latex](latex)
LaTex in a box

I keep my LaTex in a convenient and tidy box.

##[jekyll](jekyll)
Jekyll container

Use:
```
sudo docker run --rm -v "$PWD:/src" sthysel/jekyll build
```

```
alias jekyll='docker run --rm -v "$PWD:/src" -p 4000:4000 sthysel/jekyll'
jekyll build
jekyll serve -H 0.0.0.0
```

Daemon
```
sudo docker run -d -v "$PWD:/src" -p 4000:4000 sthysel/jekyll serve -H 0.0.0.0
```

Stolen from https://registry.hub.docker.com/u/grahamc/jekyll/

##[linuxperf](linuxperf)
Linux Performance tools

A container with a bunch of common Linux performance tools.

##[delta3d](delta3d)
Delta3D docker based build environment

http://delta3d.org/

##[tor](tor)
tor browser

Running ./tor.sh  should be all that's required.

```
docker run -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -v /dev/snd:/dev/snd --privileged  \
    --name torb \
    sthysel/tor
```

Stolen from https://github.com/jfrazelle/dockerfiles/tree/master/tor-browser

##[deepdream](deepdream)
Google Deepdream

Forked from https://github.com/herval/deepdream-docker, adapted for Debian Jessie.

Google's [Deepdream](https://github.com/google/deepdream/) in a Jessie container.

 Installing

The only dependency you need is [Docker](https://www.docker.com/).

 Running

```
docker run -i -t -e INPUT=your_file.png -v /path/to/your/folder:/data sthysel/deepdream
```

Replace  `/path/to/your/folder` to the folder where your `INPUT` file is. That's also where the output will be written to.


*Note*: Depending on how much memory your machine has, you might run into problems with high-res images. Bigger images require more RAM.

The output of the script will be written to the `output/` subfolder.

 Building from scratch
```
docker build -t sthysel/deepdream .
```

##[weewx](weewx)
docker-weewx
Docker image for weewx

##[glxtoys](glxtoys)
GLXToys container

##[azure](azure)
azure cli 

CLI tools to get to Microsofts azure cloud.

##[vault](vault)
vault secrets server

##[awscli](awscli)
Amazon Web Services cli tools

Amazon Web Service's cli tools in a container.

Provide the necessary creds in the config file.

##[wine](wine)
wine

Run wine in docker container.

Any wine commands should be routed through xvfb. This will emulate an X server,
so that wine will not complain about not being able to find an X server. An
example command might be:

```
xvfb-run -a wine command.exe
```

