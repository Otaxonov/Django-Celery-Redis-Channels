#!/bin/bash

# Run migrations
echo "Running migrations..."
python manage.py makemigrations
python manage.py migrate

python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'admin')"

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Run the server
echo "Starting server..."
exec daphne -b 0.0.0.0 -p 8000 DCRCH.asgi:application
