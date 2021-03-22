FROM ruby:2
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn fontconfig fonts-liberation ghostscript
RUN fc-cache -f -v

RUN bundle config --global frozen 1
WORKDIR /myapp
EXPOSE 3000

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN yarn install --check-files

CMD ["rails", "server", "-b", "0.0.0.0"]