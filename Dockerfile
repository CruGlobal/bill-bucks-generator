FROM 056154071827.dkr.ecr.us-east-1.amazonaws.com/base-image-ruby-version-arg:3.0
LABEL maintainer="cru.org <wmd@cru.org>"

ARG RAILS_ENV=production

RUN apt-get update \
  && apt-get install --no-install-recommends --fix-missing -y -q libmagickwand-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG DD_API_KEY
RUN DD_AGENT_MAJOR_VERSION=7 DD_INSTALL_ONLY=true DD_API_KEY=$DD_API_KEY bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"

# Config for logging to datadog
COPY docker/datadog-agent /etc/datadog-agent
COPY docker/supervisord-datadog.conf /etc/supervisor/conf.d/supervisord-datadog.conf
COPY docker/docker-entrypoint.sh /

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.2.22
RUN bundle install --jobs 20 --retry 5 --path vendor --without development test
RUN bundle binstub puma

COPY . ./

ARG RAILS_MASTER_KEY

RUN bundle exec rails assets:precompile RAILS_ENV=$RAILS_ENV

## Run this last to make sure permissions are all correct
RUN mkdir -p /home/app/webapp/tmp /home/app/webapp/db /home/app/webapp/log /home/app/webapp/config/secure && \
  chmod -R ugo+rw /home/app/webapp/tmp /home/app/webapp/db /home/app/webapp/log /home/app/webapp/config/secure

CMD "/docker-entrypoint.sh"