#!/bin/sh

echo "Starting celery worker..."
celery -A DCRCH beat -l INFO