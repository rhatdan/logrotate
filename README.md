# Containerized logrotate

logrotate currently does not run on an atomic host.  This repository can be used
to create a container which could be installed with atomic install
to run logrotate inside of a container.

Logrotate usualy depends on cron to be able to kick it off, but since cron does
not run on atomic host, this containerized version of logrotate will use
systemd to start the container.

You can use the buildah or docker commands to build the container image.

Check out the logotate git repo.

```
# git clone https://github.com/rhatdan/logrotate
# cd logrotate
```

Now you can build it using buildah package

```
# buildah bud .
```

or you can build it using the docker package 

```
# docker build .
```

Now you need to install logrotate using the atomic command


```
# atomic install logrotate
```
