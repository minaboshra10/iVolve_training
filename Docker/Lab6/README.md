# Docker Lab 6: Environment Variables and Resource Management

## Objective
Containerize a Flask application and practice environment variables and resource limits.

## Application
- Base image: python:3.12-slim
- Framework: Flask
- Internal port: 5000

## Task 1: Runtime Environment Variables
Built image `ivolve1` and ran `container1` with:
- APP_NAME=iVolveApp1
- APP_ENV=stg
- CPU limit: 1
- Memory limit: 256 MB

## Task 2: Resource Monitoring
Used `docker stats --no-stream container1`.
Observed memory usage: approximately 21.54 MiB out of 256 MiB.

## Task 3: Environment File
Created `PythonApp/env.txt` containing:
- APP_NAME=iVolveApp2
- APP_ENV=prod

Ran `container2` using `--env-file`.

## Task 4: Dockerfile Environment Variables
Created `PythonApp/Dockerfile.env` with:
- APP_NAME=iVolveApp3
- APP_ENV=dev

Built image `ivolve2` and ran `container3` to verify the defaults.

## Port Mapping
Host ports 5001, 5002, and 5003 were used because host port 5000 was already occupied. All application containers use port 5000 internally.

## DNS Workaround
Used `--network=host` during image builds because of the VM's build-time DNS issue.
