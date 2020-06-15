FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /personal_portfolio_rails
WORKDIR /personal_portfolio_rails
COPY Gemfile /personal_portfolio_rails/Gemfile
COPY Gemfile.lock /personal_portfolio_rails/Gemfile.lock
RUN bundle install
COPY . /personal_portfolio_rails


#docker build .
#docker images
#docker tag 2f1a0fabe8c6 personal_portfolio_rails:v0.0.1
#docker run -it -p 3000:3000 rails-docker-app:v0.0.1 bundle exec rails server -b 0.0.0.0 -p 3000
