require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = File.expand_path('../../fixtures', __FILE__)
  config.hook_into(:faraday)
end
