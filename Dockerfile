# Base image:
FROM ruby:2.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/monologue
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Gems:
COPY Gemfile Gemfile
COPY monologue.gemspec monologue.gemspec
COPY lib/monologue/version.rb lib/monologue/version.rb
#COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY config/puma.rb config/puma.rb

# Copy the main application.
COPY . .

RUN rake

#RUN RAILS_ENV=production bundle exec rake assets:precompile
#ENV RAILS_SERVE_STATIC_FILES true

#EXPOSE 3000

## The default command that gets ran will be to start the Puma server.
#ENTRYPOINT [ "bundle", "exec"]
#CMD ["puma", "-C", "config/puma.rb"]
