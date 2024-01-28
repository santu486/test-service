FROM maven:3.5-jdk-8-alpine as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install -DskipTests
FROM openjdk:8-jre-alpine
COPY --from=builder /app/target/test-service-*.jar /helloWorld.jar
EXPOSE 8080
ENV PORT 8080
CMD ["java","-Dserver.port=${PORT}","-jar","/helloWorld.jar"]
