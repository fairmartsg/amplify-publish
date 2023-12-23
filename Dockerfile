FROM node:lts

LABEL "com.github.actions.name"="GitHub action for deploying AWS Amplify project"
LABEL "com.github.actions.description"="This action builds and deploys your AWS Amplify project"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="orange"

LABEL "repository"="https://github.com/fairmartsg/amplify-publish"
LABEL "homepage"="https://github.com/fairmartsg/amplify-publish.git"

LABEL org.opencontainers.image.source=https://github.com/fairmartsg/amplify-publish

RUN npm install --global --unsafe-perm @aws-amplify/cli@latest

RUN pwd & ls

RUN git config --global --add safe.directory /github/workspace

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

