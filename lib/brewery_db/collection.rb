module BreweryDB
  class Collection
    include Enumerable

    def initialize(collection, page_count, response)
      @collection = collection
      @page_count = page_count
      @response = response
    end

    # TODO: add implementation once the API has been updated
    #def length
    #end

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
