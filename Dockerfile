FROM golang:1.9 as builder
WORKDIR /tmp
COPY . .
RUN echo foo > /tmp/bar

FROM busybox:latest as modifier
WORKDIR /tmp
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
RUN echo foo2 >> /tmp/bar

