require './lib/brewery_db/version'

Gem::Specification.new do |gem|
  gem.name = 'brewery_db'
  gem.version = BreweryDB::VERSION
  gem.summary = 'A Ruby library for using the BreweryDB API.'
  gem.homepage = 'http://github.com/tylerhunt/brewery_db'
  gem.authors = ['Tyler Hunt', 'Steven Harman']
  gem.license = 'MIT'

  gem.required_ruby_version = '>= 1.9'

  gem.add_dependency 'faraday', '~> 0.8.0'
  gem.add_dependency 'faraday_middleware', '~> 0.8'
  gem.add_dependency 'hashie', '>= 1.1', '< 3'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rspec', '~> 2.14'
  gem.add_development_dependency 'vcr', '~> 2.0'
  gem.add_development_dependency 'json'

  gem.files = `git ls-files`.split($\)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
