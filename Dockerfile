FROM alpine/git

ADD entrypoint.sh /

ENTRYPOINT [ "sh", "-c", "/entrypoint.sh" ]
