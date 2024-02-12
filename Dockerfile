ARG RUBY_VERSION=3.2.0
FROM ruby:$RUBY_VERSION

 
RUN apt-get update -qq && \
    apt-get install -y build-essential libvips bash bash-completion libffi-dev tzdata default-libmysqlclient-dev nodejs npm yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man
 
RUN gem install bundler

WORKDIR /app

COPY . /app
COPY Gemfile Gemfile.lock ./

RUN bundle install

EXPOSE  3000

