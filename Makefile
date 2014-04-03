run:
	rails server

aggregate:
	ruby bin/getter/aggregate.rb

build:
	bundle install --without production
	git commit -a -m "Update Gemfile.lock for Heroku"

deploy:
	git push heroku master