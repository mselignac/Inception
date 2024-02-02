
This project consists in setting up a small infrastructure composed of different
services under specific rules. The whole project has to be done in a virtual machine, having to use docker compose.

Each Docker image must have the same name as its corresponding service.
Each service has to run in a dedicated container.
For performance matters, the containers must be built either from the penultimate stable
version of Alpine or Debian.
Having to write my own Dockerfiles, one per service. The Dockerfiles must
be called in my docker-compose.yml by my Makefile.

The set up:
• A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
• A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.
• A Docker container that contains MariaDB only without nginx.
• A volume that contains your WordPress database.
• A second volume that contains the WordPress website files.
• A docker-network that establishes the connection between the containers.

The containers have to restart in case of a crash
