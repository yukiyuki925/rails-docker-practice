FROM --platform=linux/x86_64 ruby:3.2.1

RUN apt update -qq && apt install -y postgresql-client
RUN mkdir /task
WORKDIR /task
COPY Gemfile /task/Gemfile
COPY Gemfile.lock /task/Gemfile.lock
RUN bundle install
COPY . /task

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]