from django.shortcuts import render, redirect
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from requests import Request, post
from .credentials import *

# Create your views here.

# For Spotify
# Step 2 get user authorization
class AuthUrl(APIView):
    def get(self, request, format=None):
        scopes = 'playlist-read-collaborative playlist-read-private'

        # This generates the url as a string
        url = Request('GET', 'https://accounts.spotify.com/authorize', params={
            'scope': scopes,
            'response_type': 'code',  # We want a code in return to allow us to authenticate a user
            'redirect_uri': REDIRECT_URI,
            'client_id': CLIENT_ID
        }).prepare().url

        return Response({'url': url}, status=status.HTTP_200_OK)


# For Spotify
# Step 2 request access and refresh tokens
def spotifyCallback(request, format=None):
    code = request.GET.get('code')
    error = request.GET.get('error')

    response = post('https://accounts.spotify.com/api/token', data={
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': REDIRECT_URI,
        'client_id': CLIENT_ID,
        'client_secret': CLIENT_S
    }).json()

    access_token = response.get('access_token')
    token_type = response.get('token_type')
    refresh_token = response.get('refresh_token')
    expires_in = response.get('expires_in')
    error = response.get('error')

    if not request.session.exists(request.session.session_key):
        request.session.create()

    # Store tokens in db

    # Need to redirect to frontend page
    return redirect('frontend:')


class testApi(APIView):
    def get(self, request, format=None):
        print("Success Request")
        return Response({'Msg': 'Success'}, status=status.HTTP_200_OK)
