module BreweryDB
  class Collection
    include Enumerable

    BATCH_SIZE = 50
    attr_reader :count, :page_count

    def initialize(collection, response)
      @collection = collection
      @response = response
      @count = response.count
      @page_count = response.page_count
    end

    def each
      return to_enum unless block_given?

      while @collection.any?
        @collection.each { |element| yield(element) }

        break if @collection.size < BATCH_SIZE

        @response = @response.next_page
        @collection = Array(@response.data)
      end
    end
  end
end
