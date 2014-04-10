run:
	foreman start rails

aggregate:
	foreman start aggregate

build:
	bundle install --without production

deploy:
	git commit -a -m "Update Gemfile.lock for Heroku"
	git push heroku master

migrate:
	bundle exec rake db:migrate