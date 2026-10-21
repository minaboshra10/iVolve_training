# Docker Lab 4: Image Optimization

## Objective
Optimize a Java Spring Boot application's Docker image using a multi-stage build and run the application as a non-root user.

## Application
- Java 17
- Maven
- Spring Boot
- Container port: `8080`

## 1. Original Docker Image

The original Dockerfile used Maven as the build and runtime image, copying the entire project into the container.

Image tag: `image1`

- Disk usage: 671 MB
- Content size: 239 MB

## 2. Optimized Docker Image

The optimized Dockerfile uses a multi-stage build:

- **Build stage:** Maven compiles and packages the application.
- **Runtime stage:** A lightweight Java 17 JRE Alpine image runs the packaged JAR.
- A dedicated `appuser` account runs the application instead of root.

Build command:

```bash
docker build --network=host -t image .
```

## 3. Image Size Comparison

| Metric | Original | Optimized | Reduction |
|---|---:|---:|---:|
| Disk usage | 671 MB | 302 MB | 369 MB (~55%) |
| Content size | 239 MB | 88.2 MB | 150.8 MB (~63%) |

## 4. Run and Verify

Run the optimized image:

```bash
docker run -d --name container2 -p 8085:8080 image
```

Check application logs:

```bash
docker logs container2
```

Verify the running user:

```bash
docker exec container2 whoami
docker exec container2 id
```

The application ran as `appuser`, confirming that it did not run as root.

Test the application:

```bash
curl -i http://localhost:8085
```

## 5. Export and Import the Image

Export the image to a TAR archive:

```bash
docker save -o lab-image.tar image
```

Remove the local image:

```bash
docker rmi image
```

Load it back:

```bash
docker load -i lab-image.tar
```

Verify the restored image:

```bash
docker images
```

The image was successfully loaded again as `image:latest`.

## Conclusion

The multi-stage build reduced the image's disk usage by approximately 55% and content size by approximately 63%. The application was also verified to run as a non-root user, and the image export/import process was completed successfully.
