FROM openjdk:8

MAINTAINER Javier Boo "javier.boo@aiwin.es"

RUN apt-get update && apt-get install -y jq git

ENV SONAR_SCANNER_VERSION 4.2.0.1873
RUN set -x && curl -sLo $HOME/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
	https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip \
	&& \
	unzip $HOME/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -d $HOME && \
	mkdir /app

RUN git clone https://github.com/aiwin-tools/devops-scripts.git "$HOME/scripts"

ENV PATH "/root/sonar-scanner-${SONAR_SCANNER_VERSION}/bin:${PATH}"

WORKDIR /app

VOLUME /app

CMD ["sonar-scanner"]
