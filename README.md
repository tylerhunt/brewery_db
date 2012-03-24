# BreweryDB

A Ruby library for interfacing with the [BreweryDB][] API.

[brewerydb]: http://www.brewerydb.com/


## Installation

Add this line to your application's Gemfile:

    gem 'brewery_db'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brewery_db


## Usage

You must have a valid API key to use the BreweryDB API. If you don't yet have
one, you may [request one here][api-key].

[api-key]: http://www.brewerydb.com/developers

Use the following method to configure your API key:

    BreweryDB.configure do |config|
      config.api_key = API_KEY
    end

If you'd like to use multiple instance of the API with different keys, you may
instantiate the `BreweryDB::Client` directly and treat those instances the same
as the `BreweryDB` module:

    brewery_db = BreweryDB::Client.new

    brewery_db.configure do |config|
      config.api_key = API_KEY
    end


## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Added some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create a new Pull Request.


## Copyright

Copyright © 2012 Tyler Hunt. See LICENSE for details.
