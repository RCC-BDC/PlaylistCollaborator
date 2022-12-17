default: up

up:
	docker-compose -p spotify-app -f docker-compose.yml up -d

down:
	docker-compose -p spotify-app -f docker-compose.yml down

.PHONY: clean
clean:
	docker image prune -f
	docker volume prune -f

.PHONY: installDeps
installDeps:
	cd SpotifyApp && source .venv/bin/activate && pip3 install -r requirements.txt

#
# Build Images
#
.PHONY: app
app:
	docker build ./SpotifyApp -t spotify-app/web

.PHONY: db
db:
	docker build ./db -t spotify-app/db

.PHONY: all
all: installDeps app db
