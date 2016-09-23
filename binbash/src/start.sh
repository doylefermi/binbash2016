redis-server --daemonize yes
python manage.py celery worker -q --loglevel=info --concurrency=1 --time-limit=300 &
python manage.py runserver 0.0.0.0:8000 &
