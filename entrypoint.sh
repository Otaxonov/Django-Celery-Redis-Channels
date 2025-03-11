python manage.py makemigrations
python manage.py migrate

python manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@gmail.com', 'admin')" \

python manage.py collectstatic --no-input

python manage.py runserver 0.0.0.0:8000