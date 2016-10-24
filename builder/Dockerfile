FROM gliderlabs/alpine:3.4
MAINTAINER Ryan Cox <ryan.a.cox@gmail.com>

ARG VERSION
ENV BASENAME v${VERSION}
ENV DIRNAME OpenBFDD-${VERSION}

RUN apk update
RUN apk add alpine-sdk autoconf automake make libtool
ADD https://github.com/dyninc/OpenBFDD/archive/${BASENAME}.tar.gz /
RUN tar zxvf ${BASENAME}.tar.gz
CMD cd ${DIRNAME} && \
    ./autogen.sh && \
    ./configure && \
    make install && \
    cp bfdd-beacon /target && \ 
    cp bfdd-control /target && \ 
    cp /usr/lib/libgcc_s.so.1 /target && \ 
    cp /usr/lib/libstdc++.so.6 /target
