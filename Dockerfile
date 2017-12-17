FROM python:alpine
MAINTAINER Isulew <netcookies@gmail.com>

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&& apk add --update \
# ca-certificates gcc g++ curl openblas-dev@community
   py-numpy-dev@community \
   alpine-sdk libffi-dev libxml2-dev libxslt-dev libjpeg-turbo-dev zlib-dev freetype-dev \
   lcms2-dev libwebp-dev tcl-dev tk-dev openjpeg-dev cairo-dev pango-dev gdk-pixbuf-dev \
   && ln -s /usr/include/locale.h /usr/include/xlocale.h \
   && pip --no-cache-dir install bs4 \
   # use github version install of the pip one
   #&& pip --no-cache-dir install weasyprint \
   && pip --no-cache-dir install lxml\
   && pip --no-cache-dir install packaging\
   && pip --no-cache-dir install https://github.com/Kozea/WeasyPrint/archive/master.zip \
   && pip --no-cache-dir install PyPDF2 \
   && pip --no-cache-dir install matplotlib \
   && rm -rf /var/cache/apk/* \
   && mkdir -p /usr/share/fonts

ADD SimHei.tar.gz /usr/share/fonts
ADD SimSun.tar.gz /usr/share/fonts
#ENV LANG C.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 
