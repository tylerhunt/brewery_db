module BreweryDB
  class Collection
    include Enumerable

    BATCH_SIZE = 50

    attr_reader :size, :page_count
    alias length size

    def initialize(collection, response)
      @collection = collection || []
      @response = response
      @size = response.count || 0
      @page_count = response.page_count
    end

    def count(*args, &block)
      # The Ruby documentation is wrong, and Enumerable#count no longer calls
      # #size, so let's make sure it's used here when no arguments are given.
      if args.empty? && !block_given?
        size
      else
        super
      end
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
