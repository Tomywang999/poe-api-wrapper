# Use your existing base image
FROM python:3.11

# Install jq
RUN apt-get update && apt-get install -y jq

# Copy your application code and the entrypoint script into the Docker image
COPY . /app
COPY entrypoint.sh /entrypoint.sh

# Set the working directory
WORKDIR /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Make the entrypoint script the entrypoint of the container
ENTRYPOINT ["/entrypoint.sh"]

