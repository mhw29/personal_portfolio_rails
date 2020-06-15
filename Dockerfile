FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /personal_portfolio_rails
WORKDIR /personal_portfolio_rails
COPY Gemfile /personal_portfolio_rails/Gemfile
COPY Gemfile.lock /personal_portfolio_rails/Gemfile.lock
RUN bundle install
COPY . /personal_portfolio_rails
