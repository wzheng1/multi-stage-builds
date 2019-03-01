FROM golang:1.9 as builder
WORKDIR /tmp
COPY . .
RUN echo foo > /tmp/bar

FROM busybox:latest AS modifier
WORKDIR /tmp
COPY --from=builder /tmp/bar /tmp/bar
RUN echo foo2 >> /tmp/bar

FROM busybox:latest
WORKDIR /
COPY --from=modifier /tmp/bar /bin/baz

RUN echo /bin/baz
