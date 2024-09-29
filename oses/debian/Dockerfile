FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

## add container user
RUN useradd -m -d /home/container -s /bin/bash -U container

## optionally link nonexistent directory
RUN ln -s /home/container/ /nonexistent

ENV USER=container HOME=/home/container

## update base packages
RUN apt-get -y update \
    && apt-get -y upgrade

## install sudo and dependencies
RUN apt-get -y install sudo gcc g++ libgcc1 libgcc1 libc++-dev gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
    libfontconfig libicu63 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev libduktape203 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates tzdata \
    liblua5.3 libz-dev rapidjson-dev

## allow container user to run sudo without password
RUN echo "container ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

## configure locale
RUN update-locale lang=en_US.UTF-8 \
 && dpkg-reconfigure --frontend noninteractive locales

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
