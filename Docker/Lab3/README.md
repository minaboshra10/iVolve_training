# Docker Lab 3 – Creating a Docker Image for a Java Application

## Overview
This lab demonstrates how to create a Docker image for a Java Maven application using Java 17 and Maven inside a Docker container.

## Application
- **Project:** CalculatorMavenApp
- **Language:** Java 17
- **Build Tool:** Maven
- **Base Image:** `maven:3.9.16-eclipse-temurin-17-alpine`
- **Docker Image Name:** `app1`
- **Container Name:** `container1`

## Dockerfile

```dockerfile
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
```

## Build the Docker Image

```bash
docker build --network=host -t app1 .
```

**Note:** `--network=host` was required in this environment because DNS resolution from the default Docker network was timing out when Maven attempted to download dependencies.

## Check the Image Size

```bash
docker images app1
```

Recorded image size:
- **Disk Usage:** 587 MB
- **Content Size:** 201 MB

## Run the Container

```bash
docker run -it --name container1 app1
```

## Test Results

Test input:
- First number: `12`
- Second number: `12`

Expected output:

```text
Sum: 24.0
Subtract: 0.0
Multiply: 144.0
```

The application ran successfully and produced the expected arithmetic results.

## Cleanup

Remove the container and image after testing:

```bash
docker rm container1
docker rmi app1
```

Both the container and image were successfully removed.

## Important Notes
- The application is a console-based calculator, not a web server.
- `EXPOSE 8080` documents a port but does not make the application listen on that port.
- The image displayed a `/root/.m2` permission warning at runtime, although the calculator itself ran successfully.
