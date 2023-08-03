---
title: README
date: 16:34 08/03/2023 CST
---

# Sodavalidator

Containerized Soda Validator for CICD Pipelines within Various Tools

## Usage

To use the container, you can either pull the image from Github packages and use the local `Makefile` to `make container` or you can build the image locally.
### Remote Builds

### Local Builds

Ensure you have `make` installed.
The following builds the container and tags it with latest for all code from the `main` branch.

```
make build
make latest
make container
```

## Purpose

To use the Soda-Core Library to validate the inegrity of your data via a containerized fashion for the following types of databases:

- Snowflake
- MySQL
- Postgresql

  Container is for use with CICD Pipelines in a variety of ways to validate your data.
