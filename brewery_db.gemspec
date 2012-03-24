# -*- encoding: utf-8 -*-
require File.expand_path('../lib/brewery_db/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Tyler Hunt']
  gem.email         = ['tyler@tylerhunt.com']
  gem.description   = %q{A Ruby library for interfacing with the BreweryDB API.}
  gem.summary       = %q{A Ruby library for interfacing with the BreweryDB API.}
  gem.homepage      = 'http://github.com/tylerhunt/brewery_db'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'brewery_db'
  gem.require_paths = ['lib']
  gem.version       = BreweryDB::VERSION

  gem.add_development_dependency 'rspec'
end
