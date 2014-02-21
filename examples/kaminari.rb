# Paginate beer search results using Kaminari.

query = params[:query]
page = params[:page] || 1
per_page = BreweryDB::PaginatedCollection::BATCH_SIZE

results = client.search.beers(q: query, p: page)
count = results.count

beers = Kaminari
  .paginate_array(results.take(per_page), total_count: count)
  .page(page)
  .per(per_page)
