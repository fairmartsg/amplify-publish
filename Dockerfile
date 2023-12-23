FROM node:16.17.0-bullseye-slim

LABEL "com.github.actions.name"="GitHub action for deploying AWS Amplify project"
LABEL "com.github.actions.description"="This action builds and deploys your AWS Amplify project"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/fairmartsg/amplify-publish"
LABEL "homepage"="https://github.com/fairmartsg/amplify-publish.git"

LABEL org.opencontainers.image.source=https://github.com/fairmartsg/amplify-publish

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN npm install --global --unsafe-perm @aws-amplify/cli@latest

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
