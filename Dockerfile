FROM busybox

ENV SONAR_VERSION 3.2.0.1227

ADD https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_VERSION}-linux.zip /opt/
RUN ( \
        cd /tmp && \
        unzip sonar-scanner-cli-${SONAR_VERSION}-linux.zip \
    )
RUN ( \
        rm -f sonar-scanner-cli-${SONAR_VERSION}-linux.zip && \
        mv sonar-scanner-${SONAR_VERSION}-linux sonar-scanner \
    )

RUN ( \
        cd /opt && \
        wget http://frilm-ev-sonar:9000/static/cpp/build-wrapper-linux-x86.zip && \
        unzip build-wrapper-linux-x86.zip && \
        rm -f build-wrapper-linux-x86.zip \
    )

VOLUME /opt/sonar-scanner
VOLUME /opt/build-wrapper-linux-x86

