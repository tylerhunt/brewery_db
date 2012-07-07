require 'hashie'

module BreweryDB
  class Response < Hashie::Mash

    protected

    def convert_key(key)
      key = key.to_s.dup
      key.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      key.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
      key.tr('-', '_').downcase
    end

    def convert_value(value, duping=false)
      value.is_a?(String) ? super.gsub("\r\n", "\n") : super
    end
  end
end
