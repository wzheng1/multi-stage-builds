FROM golang:1.9
WORKDIR /tmp
COPY . .
RUN echo foo > /tmp/bar

FROM busybox:latest
WORKDIR /tmp
COPY --from=0 /tmp/bar /tmp/bar
RUN echo foo2 >> /tmp/bar

FROM busybox:latest
WORKDIR /
COPY --from=0 /tmp/bar /bin/baz

RUN echo /bin/baz
