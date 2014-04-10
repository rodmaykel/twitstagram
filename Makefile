run:
	foreman start rails

aggregate:
	foreman start aggregate

build:
	bundle install --without production

deploy:
	git push heroku master

migrate:
	bundle exec rake db:migrate

gems:
	bundle install --without production
	bundle update
	bundle install