# Changelog

## Unreleased

  * Add support for `search/upc` endpoint. ([Matt Griffin][betamatt])
  * Add support for request logging. ([Matt Griffin][betamatt])

## 0.2.2 (2013-08-05)

  * Add support for `fluidsizes`, `fluidsize/:id`, and `menu/beer-availability`
    endpoints. ([Steven Harman][stevenharman])
  * Fix: Paginate `Hops`, `Fermentables`, and `Yeasts`
    ([Steven Harman][stevenharman])

## 0.2.1 (2013-08-02)

  * Add support for `hops`, `hop/:id`, `fermentables`, `fermentable/:id`,
    `yeasts`, and `yeasts:id` endpoints ([Jésus Lopes][jtadeulopes])

## 0.2.0 (2013-06-26)

  * Add support for `locations` and `location/:id` endpoints
    ([dbc-apprentice][dbc-apprentice])
  * Add support for `subAttributeId` webhook parameter
    ([Steven Harman][stevenharman])

## 0.1.0 (2013-05-14)

  * Add support for handling webhook parameters ([Steven Harman][stevenharman])
  * Raise exceptions on unsuccessful responses ([Tyler Hunt][tylerhunt])
  * Return the data directly on successful responses
    ([Steven Harman][stevenharman])
  * Add support for `brewery/:id/beers` endpoint ([Steven Harman][stevenharman])
  * Require `faraday_middleware` ~> 0.8 ([Steven Harman][stevenharman])

## 0.0.1 (2012-05-02)

  * Initial release ([Tyler Hunt][tylerhunt])

[dbc-apprentice]: https://github.com/dbc-apprentice
[betamatt]: http://github.com/betamatt
[jtadeulopes]: https://github.com/jtadeulopes
[stevenharman]: http://github.com/stevenharman
[tylerhunt]: http://github.com/tylerhunt
