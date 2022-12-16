# Spotify App

An App for voting for songs in playlists. _Note: Recommended to exectute the below commands in a bash/zsh shell_

## Installing Dependencies

`make installDeps`

## Starting the Server Locally

`make app-dev`

## Docker

### Build the Images

`make all` or `docker build -t primary-db -f ./images/Dockerfile.db ./db`

### Run Images

`make up` or `docker-compose -p SpotifyApp -f docker-compose.yml up -d`

### Shut Down Images

`make down` or `docker-compose -p SpotifyApp -f docker-compose.yml down`