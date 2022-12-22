FROM ruby:latest
RUN bundle install
COPY ocpub.rb .
ENTRYPOINT ["ruby", "ocpub.rb"]