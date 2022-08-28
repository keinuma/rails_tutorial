.PHONY: install
install:
	bundle install

.PHONY: test
test:
	bundle exec rspec

.PHONY: console
console:
	rails console --sandbox

.PHONY: create-db
create-db:
	rake db:create

.PHONY: migrate
migrate:
	rake db:migrate
