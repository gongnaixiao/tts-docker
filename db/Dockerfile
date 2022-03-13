FROM mysql:8.0.21

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./tts.sql /docker-entrypoint-initdb.d

COPY ./tts_config.sql /docker-entrypoint-initdb.d

