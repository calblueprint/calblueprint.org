FROM ruby:2.6.6

# Install dependencies
ENV RAILS_ENV=development
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libc6-dev \
  build-essential \
  curl
RUN gem install bundler -v 2.4.22
RUN gem install logger -v 1.6.4
RUN gem update --system 3.2.3

WORKDIR /app
COPY Gemfile /app/Gemfile
RUN bundle install --gemfile /app/Gemfile
COPY . /app
# RUN yarn install
# RUN rails generate ckeditor:install
# RUN rails assets:precompile

RUN chmod +x /app/entrypoint.sh
EXPOSE 3000
CMD ["/app/entrypoint.sh"]
