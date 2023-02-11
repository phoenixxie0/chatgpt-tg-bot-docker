FROM node:lts-alpine
MAINTAINER Phoenix <hkxseven007@gmail.com>

ENV LANG C.UTF-8
ENV TZ 'Asia/Shanghai'

RUN set -ex \
        && apk add --no-cache --virtual .build-deps git \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone

RUN set -ex \
        && cd ~ \
        && git clone https://github.com/shishkevichd/telegram-chatgpt-bot \
        && cd telegram-chatgpt-bot \
        && npm install \
        && cp chatgptbot.config.example.json chatgptbot.config.json
        && apk del .build-deps \
        && rm -rf ~/.cache 
        
CMD ["node"]
