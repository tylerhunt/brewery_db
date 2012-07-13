require 'vcr'

VCR.configure do |config|
  config.hook_into(:faraday)
  config.configure_rspec_metadata!

  config.cassette_library_dir = File.expand_path('../../fixtures', __FILE__)

  config.filter_sensitive_data('API_KEY') { ENV['BREWERY_DB_API_KEY'] }
end

module VCRHelpers
  def cassette_options(options={})
    name = described_class.name.split(/::/).last.downcase
    { cassette_name: name }.merge(options)
  end
  private :cassette_options
end

RSpec.configure do |config|
  config.extend(VCRHelpers)
end
