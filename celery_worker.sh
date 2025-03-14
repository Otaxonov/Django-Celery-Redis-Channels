#!/bin/sh

echo "Starting celery worker..."
celery -A DCRCH worker -l INFO