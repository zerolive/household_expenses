FROM ruby:2.4.0

RUN mkdir -p /household_expenses
ADD . /household_expenses
WORKDIR /household_expenses

RUN gem install bundler
RUN bundle install