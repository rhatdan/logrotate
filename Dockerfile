FROM registry.fedoraproject.org/fedora:26
LABEL maintainer "Dan Walsh <dwalsh@redhat.com>"
ENV NAME=logrotate VERSION=0 RELEASE=0
LABEL com.redhat.component="$NAME" \
        name="$FGC/$NAME" \
        version="$VERSION" \
        release="$RELEASE.$DISTTAG" \
        usage="docker run --rm -v /etc:/etc -v /usr/lib:/usr/lib -v /run:/run -v /var:/var --pid=host --security-opt label=disable" \
        summary="log rotation" \
        install="docker run --rm --privileged -v /etc:/host/etc -v /usr/lib:/host/usr/lib $FGC/$NAME /install.sh" \
        uninstall="docker run --rm --privileged -v /etc:/host/etc -v /usr/lib:/host/usr/lib $FGC/$NAME /uninstall.sh" \
        help="docker run --rm logrotate --help"
ENTRYPOINT ["/usr/sbin/logrotate", "/etc/logrogate.conf"]
ADD install.sh /
ADD uninstall.sh /
RUN dnf -v -y install logrotate && dnf clean all

