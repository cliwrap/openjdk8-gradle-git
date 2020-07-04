[![Build
Status](https://travis-ci.com/cliwrap/openjdk8-gradle-git.svg?branch=master)](https://travis-ci.com/cliwrap/openjdk8-gradle-git)

The `Dockerfile` in this repository builds an `alpine:3.7` container
which lets you run commands inside the container using a UID and GID
which are passed in environment variables from outside the container,
so that any files created in a volume mount can be created as the user
and group who initiated `docker run`.  It also has `openjdk8-gradle-git`,
gradle, and git installed.

To download: [`docker pull cliwrap/openjdk8-gradle-git`](https://hub.docker.com/r/cliwrap/openjdk8-gradle-git/)

Examples
--------

Run latest gradle in current directory:

```docker run --rm -e "HOSTUID=`id -u`" -v "`pwd`:/work" -v "$HOME:/home/hostuser" cliwrap/openjdk8-gradle-git gradle build```

Use an older version like Gradle 2.14:

```docker run --rm -e "HOSTUID=`id -u`" -v "`pwd`:/work" -v "$HOME:/home/hostuser" cliwrap/openjdk8-gradle-git:2.14 gradle build```

Create a specific gradle wrapper version in the current directory:

```
rm -f tmpcidfile
docker run --cidfile=tmpcidfile -e "HOSTUID=`id -u`" \
cliwrap/openjdk8-gradle-git \
sh -c "mkdir wrap; cd wrap; \
  /opt/gradle/bin/gradle wrapper --gradle-version=2.14"
docker cp `cat tmpcidfile`:/home/hostuser/wrap .
mv wrap/* .
rm -rf wrap tmpcidfile
```
