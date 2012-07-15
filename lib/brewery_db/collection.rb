require 'forwardable'

module BreweryDB
  class Collection
    extend Forwardable
    include Enumerable

    delegate [:each, :length] => :@collection

    def initialize(collection)
      @collection = collection
    end
  end
end
