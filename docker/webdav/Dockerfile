FROM httpd:2.4-alpine
LABEL maintainer="antonyxu"
COPY files /files
RUN sh /files/install.sh && chmod +x /files/webdav.sh && ln -s /files/webdav.sh /bin/webdav
WORKDIR /usr/local/apache2
CMD [ "webdav" ]
