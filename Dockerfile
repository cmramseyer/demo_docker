FROM ruby:2.6.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev


# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /demo_docker
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

EXPOSE 3000

EXPOSE 5432
EXPOSE 5433