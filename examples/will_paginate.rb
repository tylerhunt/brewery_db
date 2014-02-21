# Paginate beer search results using will_paginate.

query = params[:query]
page = params[:page] || 1
per_page = BreweryDB::PaginatedCollection::BATCH_SIZE

results = client.search.beers(q: query, p: page)
count = results.count

beers = WillPaginate::Collection.create(page, per_page, count) do |pager|
  pager.replace results.take(per_page)
end
