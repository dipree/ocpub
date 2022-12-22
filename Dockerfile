FROM ruby:latest
EXPOSE $PORT
COPY Gemfile.lock .
RUN bundle install
COPY . .
ENTRYPOINT ["ruby", "ocpub.rb"]