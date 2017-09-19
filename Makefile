-include env_make

.PHONY: test

drupal ?= 8
php ?= 7.1

default: run

test:
	cd ./test/$(drupal)/$(php) && ./run.sh

run:
	docker-compose up -d

in-api:
	docker-compose exec api /bin/bash

in-nginx-drupal:
	docker-compose exec nginx_drupal /bin/bash

in-drupal:
	docker-compose exec drupal /bin/bash

in-nginx-php:
	docker-compose exec nginx_php /bin/bash

in-php:
	docker-compose exec php /bin/bash

in-db:
	docker-compose exec mariadb /bin/bash

stop:
	docker-compose stop

clean:
	docker-compose down

build:
	docker-compose build