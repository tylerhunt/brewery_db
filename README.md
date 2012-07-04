# BreweryDB

[![Build Status][travis]][travis-web]

[travis]: https://secure.travis-ci.org/tylerhunt/brewery_db.png
[travis-web]: http://travis-ci.org/tylerhunt/brewery_db

A Ruby library for using the [BreweryDB][] API.

[brewerydb]: http://www.brewerydb.com/


## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'brewery_db'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brewery_db


## Configuration

You must have a valid API key to use the BreweryDB API. If you don't yet have
one, you may [request one here][api-key].

[api-key]: http://www.brewerydb.com/developers

You can use the following method to configure your API key:

``` ruby
BreweryDB.configure do |config|
  config.api_key = API_KEY
end
```

If you'd like to use multiple instances of the API with different keys, you may
instantiate `BreweryDB::Client` directly and treat those instances the same as
you would the `BreweryDB` module:

``` ruby
brewery_db = BreweryDB::Client.new

brewery_db.configure do |config|
  config.api_key = API_KEY
end
```


## Usage

Once the API key has been configured, resources may be called off the module
directly or off your client instances:

``` ruby
BreweryDB.beers.all(abv: '5.5')
BreweryDB.beers.find('vYlBZQ')

BreweryDB.breweries.all(established: 2006)
BreweryDB.breweries.find('d1zSa7')

BreweryDB.categories.all
BreweryDB.categories.find(1)

BreweryDB.glassware.all
BreweryDB.glassware.find(1)

BreweryDB.search.all(q: 'IPA')
BreweryDB.search.beers(q: 'IPA')
BreweryDB.search.breweries(q: 'IPA')
BreweryDB.search.guilds(q: 'IPA')
BreweryDB.search.events(q: 'IPA')

BreweryDB.styles.all
BreweryDB.styles.find(1)
```


## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Added some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create a new Pull Request.


## Contributors

Thanks to the following people who have contributed patches or helpful
suggestions:

  * [Steven Harman](https://github.com/stevenharman)


## Copyright

Copyright © 2012 Tyler Hunt. See LICENSE for details.
