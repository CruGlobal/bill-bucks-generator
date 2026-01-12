# RUBY_VERSION set by build.sh based on .ruby-version file
ARG RUBY_VERSION
FROM public.ecr.aws/docker/library/ruby:${RUBY_VERSION}-alpine

# DataDog logs source
LABEL com.datadoghq.ad.logs='[{"source": "ruby"}]'

# Create web application user to run as non-root
RUN addgroup -g 1000 webapp \
    && adduser -u 1000 -G webapp -s /bin/sh -D webapp \
    && mkdir -p /home/webapp/app
WORKDIR /home/webapp/app

# Upgrade alpine packages (useful for security fixes)
RUN apk upgrade --no-cache

# Install rails/app dependencies
RUN apk --no-cache add \
    libc6-compat \
    git \
    postgresql-libs \
    tzdata \
    nodejs \
    imagemagick \
    imagemagick-libs \
    ghostscript \
    ghostscript-fonts \
    jemalloc

ENV LD_PRELOAD="/usr/lib/libjemalloc.so.2"

# Copy dependency definitions and lock files
COPY Gemfile Gemfile.lock .ruby-version ./

# Install bundler version which created the lock file and configure it
RUN gem install bundler -v $(awk '/^BUNDLED WITH/ { getline; print $1; exit }' Gemfile.lock)

# Install build-dependencies, then install gems, subsequently removing build-dependencies
RUN apk --no-cache add --virtual build-deps build-base postgresql-dev imagemagick-dev ghostscript-dev yaml-dev \
    && bundle install --jobs 20 --retry 2 \
    && apk del build-deps

# Copy the application
COPY . .

# Environment required to build the application
ARG RAILS_ENV=production
ARG SECRET_KEY_BASE
ARG SMTP_ADDRESS=
ARG SMTP_USER_NAME=
ARG SMTP_PASSWORD=
ARG DB_ENV_POSTGRESQL_PASS=fake
ARG BILL_BUCK_GENERATOR_DATABASE_PASSWORD=fake
ARG DB_ENV_POSTGRESQL_DB=fake
ARG DB_ENV_POSTGRESQL_USER=fake
ARG DB_PORT_5432_TCP_ADDR=localhost

# Compile assets
RUN RAILS_ENV=production bundle exec rake assets:precompile \
    && chown -R webapp:webapp /home/webapp/

# Define volumes used by ECS to share public html and extra nginx config with nginx container
VOLUME /home/webapp/app/public
VOLUME /home/webapp/app/nginx-conf

# Run container process as non-root user
USER webapp

# Command to start rails
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
