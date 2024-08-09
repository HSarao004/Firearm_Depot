# Dockerfile

FROM ruby:3.3.0

# Set build arguments
ARG SECRET_KEY_BASE

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install the gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV SECRET_KEY_BASE=${SECRET_KEY_BASE}

# Precompile assets
RUN RAILS_ENV=production bundle exec rake assets:precompile

# Command to start the server
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails server -b '0.0.0.0' -p 3000"]
