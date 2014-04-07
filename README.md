# BreweryDB

[![Gem Version](http://img.shields.io/gem/v/brewery_db.svg)](https://rubygems.org/gems/brewery_db)
[![Build Status](https://img.shields.io/travis/tylerhunt/brewery_db.svg)](https://travis-ci.org/tylerhunt/brewery_db)
[![Code Climate](http://img.shields.io/codeclimate/github/tylerhunt/brewery_db.svg)](https://codeclimate.com/github/tylerhunt/brewery_db)
[![Dependency Status](https://img.shields.io/gemnasium/tylerhunt/brewery_db.svg)](https://gemnasium.com/tylerhunt/brewery_db)

A Ruby library for using the [BreweryDB][] API.

[brewerydb]: http://www.brewerydb.com/


## Requirements

Tested and known to work with the following Rubies:

  - Ruby/MRI 1.9.2, 1.9.3, 2.0.0
  - [JRuby][] 1.7.x in 1.9 mode
  - [Rubinius][] in 1.9 mode

[jruby]: http://jruby.org/
[rubinius]: http://rubini.us/


## Installation

Add this line to your application’s `Gemfile`:

```ruby
gem 'brewery_db'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brewery_db


## Configuration

You must have a valid API key to use the BreweryDB API. If you don’t yet have
one, you may [request one here][api-key].

[api-key]: http://www.brewerydb.com/developers

You can use the following method to configure your API key:

```ruby
brewery_db = BreweryDB::Client.new do |config|
  config.api_key = API_KEY
end
```

### Logging

Optionally, you can configure `BreweryDB` to use a logger for to help with
request debugging.

```ruby
brewery_db = BreweryDB::Client.new do |config|
  # ...
  config.logger = Rails.logger
end
```

## Usage

Once an API key has been set, resources can be called on the client instance.

```ruby
brewery_db.beers.all(abv: '5.5')
brewery_db.beers.find('vYlBZQ')
brewery_db.beers.random

brewery_db.breweries.all(established: 2006)
brewery_db.breweries.find('d1zSa7')

brewery_db.brewery('d1zSa7').beers

brewery_db.categories.all
brewery_db.categories.find(1)

brewery_db.fermentables.all(country: 'Brazil')
brewery_db.fermentables.find(1924)

brewery_db.fluid_size.all
brewery_db.fluid_size.find(1)

brewery_db.glassware.all
brewery_db.glassware.find(1)

brewery_db.hops.all
brewery_db.hops.find(1)

brewery_db.search.all(q: 'IPA')
brewery_db.search.beers(q: 'IPA')
brewery_db.search.breweries(q: 'IPA')
brewery_db.search.guilds(q: 'IPA')
brewery_db.search.events(q: 'IPA')
brewery_db.search.upc(code: '030613000043')

brewery_db.styles.all
brewery_db.styles.find(1)

brewery_db.locations.all(locality: 'San Francisco')

brewery_db.yeasts.all
brewery_db.yeasts.find(1836)

brewery_db.menu.beer_availability
```

### WebHooks

The BreweryDB API also provides [webhooks][], which can be used to:

> keep your local data stores in sync with the main BreweryDB API. Instead of
> having to constantly query the API, webhooks will send you a message when
> something changes.

This library provides a simple abstraction over the data posted by those
webhooks.

```ruby
webhook = BreweryDB::WebHook.new(webhook_params_hash)
```

#### Validating a WebHook

The `webhook_params_hash` should contain the `key`, `nonce`, `action`, etc.
sent as the payload of the webhook. A `BreweryDB::WebHook` object can validate
the posted data by SHA-1 hashing your API key with the `nonce` value and
comparing it to the `key` value (as per the [docs][webhooks]).

```ruby
webhook.valid?(API_KEY) # => true or false
```

#### Idiomatic Access to WebHook Parameters

The `BreweryDB::WebHook` object also provides an idiomatic Ruby interface to
the parameters. For example, one of the parameters posted in a webhook is
`attributeId`, which is the BreweryDB ID for a brewery, beer, etc. This
parameter is exposed by an instance of `BreweryDB::WebHook` as `#attribute_id`.

Here’s the full list of parameters:

```ruby
webhook.action #=> 'insert'
webhook.attribute #=> 'beer'
webhook.attribute_id #=> 'x6bRxw'
webhook.key #=> 'some-long-key-value-here'
webhook.nonce #=> 'some-long-nonce-value-here'
webhook.sub_action #=> 'brewery-insert'
webhook.sub_attribute_id #=> 'q6vJUK'
webhook.timestamp #=> '1350573527'
```

[webhooks]: http://www.brewerydb.com/developers/docs-webhooks


### Examples

Additional examples may be found in the `examples` directory.


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
  * [Jésus Lopes](https://github.com/jtadeulopes)
  * [Matt Griffin](https://github.com/betamatt)


## Copyright

Copyright © 2012 Tyler Hunt. See LICENSE for details.
