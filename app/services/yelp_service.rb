class YelpService

  attr_reader :client

  def city_search(city)
    client.search(city)
  end

  def box_search(box, params)
    client.search_by_bounding_box(box, params)
  end

  def radius_search(coordinates, search_terms, radius = 1000, sort = 0)
    coordinates_hash = { latitude: coordinates[0], longitude: coordinates[1] }
    client.search_by_coordinates(coordinates_hash, term: search_terms, radius_filter: radius, sort: sort)
  end

  def client
    @client = Yelp::Client.new({ consumer_key: ENV['yelp_consumer_key'],
                                 consumer_secret: ENV['yelp_consumer_secret'],
                                 token: ENV['yelp_token'],
                                 token_secret: ENV['yelp_token_secret']
                                })
  end
end