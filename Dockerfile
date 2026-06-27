FROM eclipse-temurin:17-jre-jammy

ENV MULE_HOME=/opt/mule
ENV MULE_VERSION=4.11.0

# Download and install Mule runtime
RUN apt-get update && apt-get install -y wget unzip && \
    wget -q https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.zip -O /tmp/mule.zip && \
    unzip /tmp/mule.zip -d /opt && \
    mv /opt/mule-standalone-${MULE_VERSION} ${MULE_HOME} && \
    rm /tmp/mule.zip && \
    apt-get clean

# Copy built Mule app
COPY target/*.jar ${MULE_HOME}/apps/

EXPOSE 8081

CMD ["/opt/mule/bin/mule"]