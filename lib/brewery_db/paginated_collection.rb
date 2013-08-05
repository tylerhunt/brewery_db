module BreweryDB
  class PaginatedCollection < Collection
    include Enumerable

    BATCH_SIZE = 50

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
        self.response = @response.next_page
      end
    end

  private

    def response=(response)
      super
      @size = response.count || 0
    end
  end
end
