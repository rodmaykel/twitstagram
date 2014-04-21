run:
	foreman start rails

aggregate:
	foreman start aggregate

build:
	bundle install --without production

deploy:
	git push heroku master
	heroku run rake db:migrate

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