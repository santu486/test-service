FROM ubuntu:20.04
WORKDIR /app
RUN apt update -y  && apt install -y wget
RUN pwd
RUN cd /opt && wget --no-check-certificate https://downloads.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
RUN cd /opt && tar -xvf apache-maven-3.8.8-bin.tar.gz
RUN cd /opt && ln -s apache-maven-3.8.8 maven
RUN apt -y install openjdk-17-jdk
COPY pom.xml .
COPY src ./src
ENV M2_HOME /opt/maven
ENV PATH ${M2_HOME}/bin:${PATH}:/usr/bin
RUN echo $PATH
RUN mvn -version
RUN mvn install -DskipTests
RUN ls target
EXPOSE 8080
ENV PORT 8080
CMD  ["java", "-Dserver.port=8080", "-jar", "/app/target/*.jar"]
