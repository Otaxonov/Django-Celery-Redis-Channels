# Use the official Python image from Docker Hub
FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh
COPY celery_worker.sh /app/celery_worker.sh
COPY celery_beat.sh /app/celery_beat.sh

# Make the script executable
RUN chmod +x /app/entrypoint.sh
RUN chmod +x /app/celery_worker.sh
RUN chmod +x /app/celery_beat.sh

# Set the entrypoint to the entrypoint.sh script
ENTRYPOINT ["/app/entrypoint.sh"]

# Expose the port that Django will run on
EXPOSE 8000
