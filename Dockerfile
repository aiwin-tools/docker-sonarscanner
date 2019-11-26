FROM openjdk:8-alpine

MAINTAINER Javier Boo "javier.boo@aiwin.es"

RUN apk add --no-cache curl

ENV SONAR_SCANNER_VERSION 4.2.0.1873
RUN set -x && curl -sLo $HOME/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
	https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
	&& \
	unzip $HOME/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -d $HOME && \
	mkdir /app

ENV PATH "/root/sonar-scanner-${SONAR_SCANNER_VERSION}/bin:${PATH}"

WORKDIR /app

VOLUME /app

CMD ["sonar-scanner"]
