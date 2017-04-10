FROM openjdk:jre-alpine

ENV SBT_VERSION 0.13.15
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Install sbt
RUN apk add --no-cache --update bash wget && mkdir -p "$SBT_HOME" && \
    wget -qO - --no-check-certificate "https://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | tar xz -C $SBT_HOME --strip-components=1 && \
    sbt && exit && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built

WORKDIR /app
