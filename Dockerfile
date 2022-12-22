FROM ruby:latest
EXPOSE $PORT
COPY Gemfile* .
RUN bundle install
COPY . .
ENTRYPOINT ["ruby", "ocpub.rb"]
