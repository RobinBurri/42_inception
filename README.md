# 42_inception
Docker project for 42 school

The goal is to build a mini-infrastructure with 3 different services:
- a nginx container
- a MariaDB container
- a WordPress container installed and configured.

Every container is based on Alpine image and the services are downloaded
and install through bash scripts.

Docker compose is used to coordinated every services.
