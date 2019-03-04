FROM golang:1.9
WORKDIR /tmp
COPY . .
RUN echo foo > /tmp/bar0

FROM busybox:latest
WORKDIR /tmp
COPY --from=0 /tmp/bar0 /tmp/bar1
RUN echo foo2 >> /tmp/bar1

FROM busybox:latest
WORKDIR /
COPY --from=0 /tmp/bar0 /bin/baz

RUN echo /bin/baz
