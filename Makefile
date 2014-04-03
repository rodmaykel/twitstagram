run:
	foreman start rails

aggregate:
	foreman start aggregate

build:
	bundle install --without production
	git commit -a -m "Update Gemfile.lock for Heroku"

deploy:
	git push heroku master