FROM ruby:latest

RUN gem install wraith --no-document && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    echo "deb http://ftp.us.debian.org/debian jessie main contrib non-free" | tee -a /etc/apt/sources.list && \
    echo "deb http://security.debian.org/ jessie/updates contrib non-free" | tee -a /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y ttf-freefont ttf-mscorefonts-installer ttf-bitstream-vera ttf-dejavu ttf-liberation google-chrome-beta imagemagick && \
    apt autoremove -y && apt clean && rm -rf /var/lib/apt/lists/* && \
    mkdir /wraith

WORKDIR /wraith

ENTRYPOINT [ "wraith" ]
