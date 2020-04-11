FROM ruby:2.6.5

WORKDIR /home/app

ENV PORT 3000
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER=rails_user
ARG GROUP=rails_users

EXPOSE $PORT

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn

# Setup Rails user
RUN groupadd -g $GROUP_ID $GROUP
RUN useradd -m -u $USER_ID -g $GROUP_ID $USER
RUN chown -R $USER_ID:$GROUP_ID ./
USER $USER

# Setup Rails app
RUN gem install bundler
COPY --chown=$USER_ID:$GROUP_ID ./Gemfile ./Gemfile
COPY --chown=$USER_ID:$GROUP_ID ./Gemfile.lock ./Gemfile.lock

RUN mkdir  -p ./vendor/bundle
RUN bundle config set path 'vendor/bundle'
RUN bundle install

COPY --chown=$USER_ID:$GROUP_ID . .

ENV PATH="/home/app/bin:${PATH}"
RUN rails yarn:install

ENTRYPOINT [ "sh", "./docker/entry.sh" ]

CMD bundle exec rails s -p $PORT -b 0.0.0.0
