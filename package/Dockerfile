FROM gliderlabs/alpine:3.4
MAINTAINER Ryan Cox <ryan.a.cox@gmail.com>

ADD target/bfdd-control /usr/local/bin
ADD target/bfdd-beacon /usr/local/bin
ADD target/libgcc_s.so.1 \
    target/libstdc++.so.6 \
    /usr/local/lib/
