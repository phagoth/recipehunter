class Recipe
  include HTTParty

  key_value = ENV[’FOOD2FORK_KEY’] || "4d6c352304c1cf9400aae6b969c7782f"
  hostport  = ENV[’FOOD2FORK_SERVER_AND_PORT’] || "www.food2fork.com"

  base_uri "http://#{hostport}/api"
  default_params key: key_value 
  format :json

  def self.for(term, page_number = 1)
    get("/search", query: {q: term, page: page_number})
  end

end