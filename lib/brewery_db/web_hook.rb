require 'digest/sha1'

module BreweryDB
  class WebHook
    attr_reader :action
    attr_reader :attribute
    attr_reader :attribute_id
    attr_reader :key
    attr_reader :nonce
    attr_reader :sub_action
    attr_reader :timestamp

    def initialize(args)
      @action = args[:action]
      @attribute = args[:attribute]
      @attribute_id = args[:attributeId]
      @key = args[:key]
      @nonce = args[:nonce]
      @sub_action = args[:subAction]
      @timestamp = args[:timestamp]
    end

    def valid?(api_key)
      hash(api_key) == key
    end

    def hash(api_key)
      Digest::SHA1.hexdigest("#{api_key}#{nonce}")
    end
    private :hash
  end
end
