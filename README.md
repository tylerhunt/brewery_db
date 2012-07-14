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
brewery_db = BreweryDB::Client.new do |config|
  config.api_key = API_KEY
end
```


## Usage

Once an API key has been set, resources can be called on the client instance.

``` ruby
brewery_db.beers.all(abv: '5.5')
brewery_db.beers.find('vYlBZQ')

brewery_db.breweries.all(established: 2006)
brewery_db.breweries.find('d1zSa7')

brewery_db.brewery('d1zSa7').beers

brewery_db.categories.all
brewery_db.categories.find(1)

brewery_db.glassware.all
brewery_db.glassware.find(1)

brewery_db.search.all(q: 'IPA')
brewery_db.search.beers(q: 'IPA')
brewery_db.search.breweries(q: 'IPA')
brewery_db.search.guilds(q: 'IPA')
brewery_db.search.events(q: 'IPA')

brewery_db.styles.all
brewery_db.styles.find(1)
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
