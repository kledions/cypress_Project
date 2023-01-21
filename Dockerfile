# https://urldefense.com/v3/__https://github.com/jenkinsci/docker-ssh-agent__;!!C8mu0vCj!dIyo7B2NfjYIxD1fNPOGTRyqo2_IiOro3QsOEwkeWRBTc3ZkoEsmfMciVB2qXwYaP-YCC7BFfO6ayFA4$ 
FROM jenkins/ssh-agent:bullseye-jdk17 as ssh-agent
# COPY --chown=jenkins jenkins_agent_key.pub "${JENKINS_AGENT_HOME}"/.ssh/mykey

# https://urldefense.com/v3/__https://stackoverflow.com/questions/63293440/cypress-jenkins-install-system-dependency-xvfb-via-jenkinsfile__;!!C8mu0vCj!dIyo7B2NfjYIxD1fNPOGTRyqo2_IiOro3QsOEwkeWRBTc3ZkoEsmfMciVB2qXwYaP-YCC7BFfOo3TYlJ$ 
# Image installing Cypress Test Runner system dependencies
RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  # install cypress system dependencies
  libgtk2.0-0 \
  libgtk-3-0 \
  libnotify-dev \
  libgconf-2-4 \
  libgbm-dev \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  tidy \
  xauth \
  xvfb \
  nodejs \
  npm \
  git \
  wget \
  gnupg2 \
  # clean up
  && rm -rf /var/lib/apt/lists/*

# https://urldefense.com/v3/__https://github.com/cypress-io/cypress-docker-images/blob/master/browsers/chrome69/Dockerfile__;!!C8mu0vCj!dIyo7B2NfjYIxD1fNPOGTRyqo2_IiOro3QsOEwkeWRBTc3ZkoEsmfMciVB2qXwYaP-YCC7BFfBqUjVX8$ 
# install Chromebrowser
RUN \
  wget -q -O - https://urldefense.com/v3/__https://dl-ssl.google.com/linux/linux_signing_key.pub__;!!C8mu0vCj!dIyo7B2NfjYIxD1fNPOGTRyqo2_IiOro3QsOEwkeWRBTc3ZkoEsmfMciVB2qXwYaP-YCC7BFfFUqI6Co$  | apt-key add - && \
  echo "deb https://urldefense.com/v3/__http://dl.google.com/linux/chrome/deb/__;!!C8mu0vCj!dIyo7B2NfjYIxD1fNPOGTRyqo2_IiOro3QsOEwkeWRBTc3ZkoEsmfMciVB2qXwYaP-YCC7BFfLGud9yj$  stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y dbus-x11 google-chrome-stable && \
  rm -rf /var/lib/apt/lists/*

