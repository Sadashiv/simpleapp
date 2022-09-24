from django.shortcuts import render

from django.http import HttpResponse
from django.shortcuts import redirect

# Create your views here.
def index(request):
    """ """
    #return HttpResponse("Welcome to Sample Application home page 1.0")
    text = """
            <body style="background-color:green;">
            <h1 align="center" style="text-color:green;">Welcome to Djano Application home page 3.0</h1>
            </body>
            """
    return HttpResponse(text)

