FROM alpine as base


RUN apk add -U --no-cache unzip

ADD https://www.terraria.org/system/dedicated_servers/archives/000/000/038/original/terraria-server-1404.zip /terraria.zip

#For local testing
#COPY terraria-server-1404.zip /terraria.zip

RUN cd / && \
    unzip -qq /terraria.zip && \
    chmod +x /1404/Linux/TerrariaServer.bin.x86_64

FROM mono:6.8-slim

EXPOSE 7777

RUN  mkdir /TerrariaServer && \
    mkdir /etc/Terraria && \
    mkdir -p /var/log/Terraria && \
    mkdir -p /usr/local/games/Terraria/Worlds && \
    apt update && \
    apt install -y tmux locales-all && \
    rm -rf /var/lib/apt/lists/*

COPY --from=base /1404/Linux/* /TerrariaServer/
COPY docker-entrypoint /docker-entrypoint

ENTRYPOINT [ "./docker-entrypoint" ]
