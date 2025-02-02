from django.shortcuts import render
from django.views import View

# Create your views here.


class JokesView(View):
    template_name = 'jokes/home.html'
    context = {'title': 'Jokes App'}

    def get(self, request, *args, **kwargs):
        return render(request=request, template_name=self.template_name, context=self.context)
