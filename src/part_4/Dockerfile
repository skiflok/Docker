FROM nginx
WORKDIR /server
COPY . .
COPY nginx ../etc/nginx/
RUN  \
    apt-get update && \
    apt-get install -y \
    gcc  \
    spawn-fcgi  \
    libfcgi-dev && \
    rm -rf /var/lib/apt/lists/* && \
    gcc server.c -lfcgi -o server && \
    chmod +x server_run.sh

ENTRYPOINT ["./server_run.sh"]