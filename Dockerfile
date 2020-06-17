FROM ruby:2.6.0
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev postgresql-client

RUN apt-get install apt-transport-https ca-certificates -y
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install yarn

WORKDIR /personal_portfolio_rails
COPY Gemfile /personal_portfolio_rails/Gemfile
COPY Gemfile.lock /personal_portfolio_rails/Gemfile.lock

ENV BUNDLE_PATH /box

RUN bundle check || bundle install

RUN yarn install --check-files
ADD . /personal_portfolio_rails
RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]


#docker build .
#docker images
#docker tag 2f1a0fabe8c6 personal_portfolio_rails:v0.0.1
#docker run -it -p 3000:3000 rails-docker-app:v0.0.1 bundle exec rails server -b 0.0.0.0 -p 3000


#ECS Deployment
#docker build . -t personal-portfolio-rails
#docker tag personal-portfolio-rails:latest 943337485558.dkr.ecr.us-east-1.amazonaws.com/personal-portfolio-rails:v1.0.0
#aws ecr get-login --no-include-email --region=us-east-1
#Copy entire response back into terminal
#docker push 943337485558.dkr.ecr.us-east-1.amazonaws.com/personal-portfolio-rails:v1.0.0
