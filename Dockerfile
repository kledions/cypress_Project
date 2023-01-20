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
  # clean up
  && rm -rf /var/lib/apt/lists/*

RUN chown jenkins:jenkins -R /home/jenkins

RUN sh -c "echo 'Cypress Build image maintained by Raccoons' >> /build_image.info"
USER jenkins

RUN    echo  "NODE_VERSION:     $NODE_VERSION" \
    && echo  "NVM_DIR:          $NVM_DIR" \
    # NVM install
    && . $NVM_DIR/nvm.sh \
    # NPM and Node install
    && nvm install $NODE_VERSION \
    # cypress install
    echo  "CYPRESS_VERSION:     $CYPRESS_VERSION" \
    && npm install -g cypress@$CYPRESS_VERSION \
    && cypress verify \
    && cypress info