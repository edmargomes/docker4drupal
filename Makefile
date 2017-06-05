-include env_make

.PHONY: test

drupal ?= 8
php ?= 7.1

default: run

test:
	cd ./test/$(drupal)/$(php) && ./run.sh

run:
	docker-compose up -d

in:
	docker exec -it $(shell docker-compose ps | grep _php_ | cut -d" " -f 1) /bin/bash

stop:
	docker-compose stop

clean:
	docker-compose down

build:
	docker-compose build