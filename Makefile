run:
	foreman start rails

aggregate:
	foreman start aggregate

build:
	bundle install --without production

migrate:
	bundle exec rake db:migrate

gems:
	bundle install --without production
	bundle update
	bundle install

test:
	bundle exec rspec

test-server:
	echo "TODO"

deploy:
	git push heroku master
	heroku run rake db:migrate

aggregate-prod:
	heroku run ruby bin/getter/aggregate.rb

migrate-prod:
	echo "TODO"