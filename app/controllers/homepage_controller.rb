class HomepageController < ApplicationController
  
  def index
    
  end
  
  def reccomend
    @restaurants = get_restaurants(:zipcode => params[:address][:zipcode]).shuffle
    p @restaurants
  end
  
  
  
  private
    API_KEY = "unn1gE7DXXB6uWw9BfaXDQ" 
  
    def get_restaurants(location)
    client = Yelp::Client.new
  
    request = Yelp::Review::Request::Location.new({
      :zipcode => location[:zipcode],
      #:address => "1035 Pine Street",
      :city => "San Francisco",
      :state => "CA",
      :radius => 1,
      :category => ["restaurants"],
      :yws_id => API_KEY,
      :is_closed => "false"
    })
      
      response = client.search(request)    
      response["businesses"]
  end
  
end
