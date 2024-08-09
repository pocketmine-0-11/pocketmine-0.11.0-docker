FROM debian:stable
RUN apt-get update && apt-get install -y wget tar ripgrep git net-tools
ARG PHP_POCKETMINE_URL=https://sourceforge.net/projects/pocketmine/files/builds/PHP_5.6.8_x86-64_Linux.tar.gz/download
ARG PHP_BINARY=/pocketmine/bin/php5/bin/php

RUN mkdir /pocketmine

WORKDIR /pocketmine
RUN wget --no-check-certificate $PHP_POCKETMINE_URL -O php.tar.gz
RUN tar xzf php.tar.gz
RUN ln -s /pocketmine/bin/php5/bin/php /usr/bin/php
RUN chmod o+x /usr/bin/php

WORKDIR /pocketmine
RUN git -c http.sslVerify=false clone --recurse-submodules https://github.com/PocketMine/PocketMine-MP.git
RUN mv PocketMine-MP server
WORKDIR /pocketmine/server
RUN git reset --hard 0c09361
RUN ln -s /pocketmine/server/plugins /plugins
RUN ln -s /pocketmine/server/worlds /worlds
WORKDIR /pocketmine/server/src/spl
RUN git reset --hard d59c0f673455f02b2620853f3fa6290d63ffd960
WORKDIR /pocketmine/server/src/raklib
RUN git reset --hard ab3ff4420f6dea3371bfc410bbb783159cd0560b
WORKDIR /pocketmine/server
RUN cp -r /pocketmine/bin /pocketmine/server/bin
ENV TERM=xterm
COPY scripter.sh /pocketmine/server/scripter.sh
RUN chmod +x /pocketmine/server/scripter.sh

USER root

EXPOSE 19132/tcp
EXPOSE 19132/udp

VOLUME ["/plugins"]
VOLUME ["/worlds"]

CMD ["/pocketmine/server/scripter.sh"]
