FROM nginx:1.17

LABEL maintainer="SDF Ops Team <ops@stellar.org>"

RUN mkdir /usr/share/nginx/html/charts/ && rm /usr/share/nginx/html/index.html
COPY docker/default.conf /etc/nginx/conf.d/
COPY README.md /usr/share/nginx/html/
COPY scratchdir/ /usr/share/nginx/html/charts/
