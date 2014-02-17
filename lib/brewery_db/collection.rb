module BreweryDB
  class Collection
    include Enumerable

    attr_reader :size, :response
    alias length size

    def initialize(response)
      self.response = response
    end

    def each
      return to_enum unless block_given?
      @collection.each { |element| yield(element) }
    end

    def collection
      self
    end

    def paginated
      PaginatedCollection.new(@response)
    end

  private

    def response=(response)
      @response = response
      @collection = Array(response.data) || []
      @size = @collection.length
    end
  end
end
