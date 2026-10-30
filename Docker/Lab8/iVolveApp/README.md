# Lab 8: Containerized Node.js and MySQL Stack Using Docker Compose

## Objective
Deploy a Node.js web application with a MySQL database using Docker Compose, configure persistent storage, establish container networking, verify database connectivity, and publish the application image to Docker Hub.

## Application
- Source: [iVolveApp](https://github.com/Ibrahim-Adel15/iVolveApp)
- Backend: Node.js + Express
- Database: MySQL 8.0
- Container orchestration: Docker Compose

## Architecture

The application consists of two services:

1. **App Service**
   - Builds the Node.js application from a Dockerfile.
   - Exposes port `3000`.
   - Connects to MySQL using environment variables.
   - Stores application logs in `/app/logs`.

2. **Database Service**
   - Uses the official `mysql:8.0` image.
   - Creates the `ivolve` database and application user during initial database initialization.
   - Stores database files in `/var/lib/mysql`.

Both services communicate through a custom bridge network named `ivolve-net`.

## Docker Compose Configuration

- App port mapping: `3000:3000`
- Database hostname: `db`
- Database name: `ivolve`
- App environment variables:
  - `DB_HOST=db`
  - `DB_USER=ivolveuser`
  - `DB_PASSWORD=ivolvepass`
  - `DB_NAME=ivolve`

### Persistent Volumes

| Volume | Container Path | Purpose |
|---|---|---|
| `ivolveapp_db_data` | `/var/lib/mysql` | Persistent MySQL data |
| `ivolveapp_app_logs` | `/app/logs` | Persistent application logs |

### Network

`ivolve-net` is a custom Docker bridge network that allows the application to communicate with MySQL using the service name `db`.

## Build and Run

Validate the Compose configuration:

```bash
docker compose config
```

Build the application image and start the services:

```bash
docker compose up -d --build
```

Check running containers:

```bash
docker compose ps
```

View application logs:

```bash
docker compose logs app
```

View database logs:

```bash
docker compose logs db
```

**Build networking note:** `network: host` was configured under the app's build section to resolve DNS issues while downloading npm packages. The containers still use the custom bridge network at runtime.

## Verification and Testing

### 1. Application Health

```bash
curl http://localhost:3000/health
```

### 2. Application Readiness and Database Connectivity

```bash
curl http://localhost:3000/ready
```

Both endpoints returned successful responses.

### 3. Database Verification

```bash
docker compose exec db mysql -uivolveuser -pivolvepass -D ivolve -e "SHOW DATABASES; SHOW TABLES;"
```

Verified that the `ivolve` database exists and the application user can access it.

### 4. Volume Verification

```bash
docker volume ls
```

Inspect database volume:

```bash
docker inspect ivolve-db --format '{{json .Mounts}}'
```

Inspect application logs volume:

```bash
docker inspect ivolve-app --format '{{json .Mounts}}'
```

### 5. Application Logs Verification

```bash
docker compose exec app sh -c 'ls -lh /app/logs && tail -n 10 /app/logs/access.log'
```

Verified that HTTP requests were recorded in `access.log`.

## Docker Hub Deployment

Application image:

```text
minaboshra/ivolveapp:lab8
```

Tag the image:

```bash
docker tag ivolveapp-app minaboshra/ivolveapp:lab8
```

Authenticate with Docker Hub:

```bash
docker login
```

Push the image:

```bash
docker push minaboshra/ivolveapp:lab8
```

Docker Hub repository:

[https://hub.docker.com/r/minaboshra/ivolveapp](https://hub.docker.com/r/minaboshra/ivolveapp)

**Push status:** Successful.

## Cleanup

Stop and remove containers and the Compose network:

```bash
docker compose down
```

Named volumes are preserved by this command.

To remove volumes as well, use `docker compose down -v` only when deleting the persistent data is intentional.

## Skills Practiced

- Dockerfile creation and image building.
- Docker Compose multi-container orchestration.
- Docker bridge networking and service discovery.
- Environment variable configuration.
- Persistent volumes for database data and application logs.
- Container health and database connectivity testing.
- Docker Hub image tagging and publishing.
