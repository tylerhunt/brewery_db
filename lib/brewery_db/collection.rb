module BreweryDB
  class Collection
    include Enumerable

    def initialize(collection, page_count, request)
      @collection = collection
      @page_count = page_count
      @request = request
    end

    # TODO: add implementation once the API has been updated
    #def length
    #end

    def each
      return to_enum unless block_given?

      while @request.page_number <= @page_count
        @collection.each { |element| yield(element) }
        @request.next_page
        @collection = @request.body
      end
    end
  end
end
