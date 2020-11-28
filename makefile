run: up
	docker-compose exec bio bash
build:
	docker-compose build
up:
	docker-compose up -d
down:
	docker-compose down
