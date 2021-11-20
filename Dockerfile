FROM ruby:2.6.0

RUN apt update && apt install -y \
  build-essential imagemagick \
  netcat \
  postgresql-client \
  git

ENV APP_PATH /usr/src/app
WORKDIR $APP_PATH

COPY . . 

RUN ["bash", ".docker/bundle-install.sh"]

EXPOSE 3000

ENTRYPOINT ["bash", ".docker/entrypoint.sh"]