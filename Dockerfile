
FROM ruby:latest

RUN apt-get update -qq \
  && apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && gem update --system \
  && gem install bundler \
  && gem install rails -v 5.2.3

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle

CMD rails s -b 0.0.0.0
