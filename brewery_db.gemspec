require './lib/brewery_db/version'

Gem::Specification.new do |gem|
  gem.name = 'brewery_db'
  gem.version = BreweryDB::VERSION
  gem.summary = 'A Ruby library for interfacing with the BreweryDB API.'
  gem.homepage = 'http://github.com/tylerhunt/brewery_db'
  gem.author = 'Tyler Hunt'

  gem.required_ruby_version = '>= 1.9'

  gem.add_dependency 'faraday', '~> 0.8.0'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'hashie', '~> 1.1'
  gem.add_development_dependency 'rspec', '~> 2.0'
  gem.add_development_dependency 'vcr', '~> 2.0'

  gem.files = `git ls-files`.split($\)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
