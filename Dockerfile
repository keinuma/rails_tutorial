FROM ruby:3.1.2

# Node のインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

# Yarn のインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn

ADD . /work
WORKDIR /work

# Rails のインストール
RUN bundle install
