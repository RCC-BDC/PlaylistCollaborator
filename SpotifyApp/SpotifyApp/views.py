from django.http import HttpResponse


def index(request):
    return HttpResponse("Finally. Hello, world. #SpotifyApp")
