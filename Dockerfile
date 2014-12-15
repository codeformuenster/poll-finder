FROM ruby:2.1.5-onbuild

RUN bundle install
EXPOSE 4567
CMD ["bundle", "exec", "rackup", "-p", "4567"]
