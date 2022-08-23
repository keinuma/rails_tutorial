.PHONY: test
test:
	bundle exec rspec

.PHONY: console
console:
	rails console --sandbox
