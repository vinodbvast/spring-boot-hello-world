# Use an official base image from Docker Hub
FROM ubuntu:22.04

# Update and install packages
RUN apt-get update -y && \
    apt-get install -y \
    curl \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Define environment variables (optional)
ENV MY_ENV_VARIABLE="Hello, World!"

# Create a directory for your application (optional)
WORKDIR /app

# Expose a port (optional)
EXPOSE 8080

# Run a command when the container starts
CMD ["echo", "Hello, Docker!"]
