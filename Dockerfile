FROM ruby:latest
EXPOSE $PORT
COPY Gemfile* ./
RUN bundle install
COPY . .
ENTRYPOINT ["bundle", "exec", "unicorn", "-l", "$PORT"]
