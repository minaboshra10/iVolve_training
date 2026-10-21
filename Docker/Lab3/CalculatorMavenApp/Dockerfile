FROM maven:3.9.16-eclipse-temurin-17-alpine

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn package

RUN adduser -D -h /home/appuser appuser

ENV HOME=/home/appuser

USER appuser

EXPOSE 8080

CMD ["java", "-jar", "target/calculator.jar"]

