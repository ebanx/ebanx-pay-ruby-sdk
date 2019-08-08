FROM ruby:latest

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
WORKDIR /usr/src/ebanx-ruby
COPY . .
# COPY Gemfile Gemfile.lock ebanx.gemspec lib/ebanx/version.rb ./
RUN bundle install
# RUN gem build ebanx.gemspec
# RUN rm -rf /usr/src/ebanx-ruby/*