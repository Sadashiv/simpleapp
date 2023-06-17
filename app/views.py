from django.shortcuts import render

from django.http import HttpResponse
from django.shortcuts import redirect

# Create your views here.
def index(request):
    """ """
        """ """
    get_color = os.environ.get('APP_COLOR')
    #return HttpResponse("Welcome to Sample Application home page 1.0")
    text = """
            <body style="background-color:%s;">
            <h1 align="center" style="text-color:%s;">Welcome to Djano Application with APP_COLOR</h1>
            </body>
            """ %(get_color,get_color)

    return HttpResponse(text)

