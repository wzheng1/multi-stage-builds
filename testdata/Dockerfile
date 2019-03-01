FROM golang:1.9 as builder
WORKDIR /tmp
COPY . .
RUN echo foo > /tmp/bar0

FROM busybox:latest AS modifier
WORKDIR /tmp
ENV NAME value
COPY --from=builder /tmp/bar0 /tmp/bar1
RUN echo foo1 >> /tmp/bar1
CMD ["ls" "/tmp/bar"]

FROM busybox:latest
WORKDIR /
COPY --from=modifier /tmp/bar1 /bin/baz

RUN echo /bin/baz
