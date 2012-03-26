require 'hashie'

module BreweryDB
  class Response < Hashie::Mash
    def convert_key(key)
      key = key.to_s.dup
      key.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      key.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
      key.tr('-', '_').downcase
    end
    protected :convert_key
  end
end
