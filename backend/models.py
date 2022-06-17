from django.db import models

# Create your models here.

class Vote(models.Model):
    vote_type = models.CharField(max_length=6, unique=False)
    track_id = models.CharField(max_length=128, unique=False)
    playlist_id = models.CharField(max_length=128, unique=False)
    occurrence = models.IntegerField(default=1, unique=False)
    user = models.CharField(max_length=64, unique=False)


class SpotifyToken(models.Model):
    user = models.CharField(max_length=50, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)
    refresh_token = models.CharField(max_length=150)
    access_token = models.CharField(max_length=150)
    expires_in = models.DateTimeField()
    token_type = models.CharField(max_length=50)
