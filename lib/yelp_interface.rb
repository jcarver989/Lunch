module YelpInterface
  API_KEY = "unn1gE7DXXB6uWw9BfaXDQ" 
 
  def self.get_restaurants(location)
    client = Yelp::Client.new
  
    request = Yelp::Review::Request::Location.new({
      :zipcode => location[:zipcode]
      :radius => 2,
      :category => ["restaurants"],
      :yws_id => API_KEY })
      response = client.search(request)    
      response["businesses"]
  end
 
end
 
 


