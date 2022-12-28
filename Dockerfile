FROM ruby:3.1.3
EXPOSE $PORT
COPY Gemfile* ./
RUN bundle install
COPY . .
ENTRYPOINT ["bundle", "exec", "unicorn"]
