# Ubuntu temel imajı kullan
FROM ubuntu:20.04

# Non-interactive ortam ayarları
ENV DEBIAN_FRONTEND=noninteractive

# Gerekli paketleri yükle
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    git \
    vim \
    build-essential \
    iproute2 \
    net-tools \
    netcat \
    telnet \
    locales \
    ffmpeg \
    ca-certificates \
    software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Locale ayarları
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# Kullanıcı oluştur ve ayarları yap
RUN useradd -m -d /home/container -s /bin/bash container && \
    echo "container ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Çalışma dizinine geç
WORKDIR /home/container

# Giriş betiğini kopyala
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Başlangıç komutu
CMD ["/bin/bash", "/entrypoint.sh"]
