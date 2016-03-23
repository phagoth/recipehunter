class Recipe
  include HTTParty

  key_value = ENV[’FOOD2FORK_KEY’]
  hostport  = ENV[’FOOD2FORK_SERVER_AND_PORT’]

  base_uri "http://#{hostport}/api"
  default_params key: key_value 
  format :json

  def self.for(term, page_number = 1)
    get("/search", query: {q: term, page: page_number})
  end

end