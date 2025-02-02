from django.urls import path
from Jokes.views import JokesView

urlpatterns = [
    path('', JokesView.as_view(), name='jokes_home')
]