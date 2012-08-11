module BreweryDB
  class Collection
    include Enumerable

    attr_reader :count, :page_count

    def initialize(collection, response)
      @collection = collection
      @response = response
      @count = response.count
      @page_count = response.page_count
    end

    def each
      return to_enum unless block_given?

      while @response.page_number <= @page_count
        @collection.each { |element| yield(element) }
        @response = @response.next_page
        @collection = @response.data
      end
    end
  end
end
