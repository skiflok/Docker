FROM nginx
WORKDIR /server
COPY server.c .
COPY server_run.sh .
COPY nginx ../etc/nginx/
RUN  \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /var/cache/nginx && \
    apt-get update && \
    apt-get install -y \
    gcc  \
    spawn-fcgi  \
    libfcgi-dev && \
    rm -rf /var/lib/apt/lists/* && \
    gcc server.c -lfcgi -o server && \
    chmod +x server_run.sh \
    && chmod 777 /home \
    && chmod 755 /sbin/unix_chkpwd \
    && chmod u-s /usr/bin/chsh \
    && chmod u-g /usr/bin/chsh \
    && chmod 755 /usr/bin/chage \
    && chmod u-s /bin/su \
    && chmod u-g /bin/su \
    && chmod 755 /usr/bin/wall \
    && chmod u-s /usr/bin/chfn \
    && chmod u-g /usr/bin/chfn \
    && chmod u-s /usr/bin/gpasswd \
    && chmod u-g /usr/bin/gpasswd \
    && chmod u-s /bin/mount \
    && chmod u-g /bin/mount \
    && chmod u-s /usr/bin/newgrp \
    && chmod u-g /usr/bin/newgrp \
    && chmod 755 /usr/bin/expiry \
    && chmod u-s /bin/umount \
    && chmod u-g /bin/umount \
    && chmod u-s /usr/bin/passwd \
    && chmod u-g /usr/bin/passwd

USER nginx


ENTRYPOINT ["./server_run.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

