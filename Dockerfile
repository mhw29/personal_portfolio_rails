FROM ruby:2.6.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /personal_portfolio_rails
WORKDIR /personal_portfolio_rails
COPY Gemfile /personal_portfolio_rails/Gemfile
COPY Gemfile.lock /personal_portfolio_rails/Gemfile.lock
RUN bundle install
COPY . /personal_portfolio_rails

# Add a script to be executed every time the container starts.
COPY deployment_scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["deployment_scripts/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]