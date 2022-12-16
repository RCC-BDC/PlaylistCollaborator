default: all

up:
	docker-compose -p gatech -f docker-compose.yml up -d

down:
	docker-compose -p gatech -f docker-compose.yml down

.PHONY: clean
clean:
	docker image prune -f
	docker volume prune -f

.PHONY: installDeps
installDeps:
	cd app
	source .venv/bin/activate
	pip3 install -r requirements.txt

.PHONY: appDev
appDev:
	cd SpotifyApp && source .venv/bin/activate && python3 manage.py runserver

#
# Build Images
#
.PHONY: app
app:
	docker build -t app -f ./Dockerfiles/Dockerfile.app ./SpotifyApp

.PHONY: db
db:
	docker build -t primary-db -f ./Dockerfiles/Dockerfile.db ./db

.PHONY: all
all: app db up
