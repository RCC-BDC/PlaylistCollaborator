from django.urls import path
from .views import testApi, AuthUrl, spotifyCallback

urlpatterns = [
    path('status', testApi.as_view()),
    path('get-auth-url', AuthUrl.as_view()),
    path('redirect', spotifyCallback)
]