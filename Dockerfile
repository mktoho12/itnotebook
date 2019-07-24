FROM ruby:latest

RUN apt-get update -qq \
  && apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && gem update --system \
  && gem install bundler

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle


CMD bundle exec rails s -b 0.0.0.0
