FROM golang:1.9 as builder
WORKDIR /tmp
COPY . .
RUN echo foo > /tmp/bar0

FROM busybox:latest AS modifier
WORKDIR /tmp
COPY --from=builder /tmp/bar0 /tmp/bar1
RUN echo foo2 >> /tmp/bar

FROM busybox:latest
WORKDIR /
COPY --from=modifier /tmp/bar1 /bin/baz

RUN echo /bin/baz
