FROM golang:1.9
WORKDIR /tmp
COPY . .
RUN echo foo > /tmp/bar

FROM busybox:latest
WORKDIR /tmp
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
RUN echo foo2 >> /tmp/bar

