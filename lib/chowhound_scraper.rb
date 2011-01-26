require 'rubygems'
require 'open-uri'
require 'hpricot'

class ChowhoundScraper  

  def initialize

  end
  
  def scrape(location = 94108)
    url = "http://www.chow.com/search?query=&location=#{location}&type=Restaurant"
    response = ""
    open(url, "User-Agent" => "Ruby/#{RUBY_VERSION}", "Referer" => "none") do |f|
      puts "Fetched document: #{f.base_uri}"
      response = f.read
    end
    
    doc = Hpricot(response)
    
    doc.search("ul[@id=results_list]/li").inject([]) do |restaurants, restaurant|
      restaurant_html = (restaurant/"span.result_title").innerHTML
      price_html = (restaurant/"a"/"span.price_sprite")[0].attributes['style']
      name   = extract_name(restaurant_html)
      price  = extract_price(price_html)
      rating = extract_rating(rating_html)
    end
  end
  
  
  private
  
  def extract_name(html)
    html.slice!(/<img.*>/)
    html.slice!(/<span.*>.*<\/span>/)
    html.strip!    
  end
  
  def extract_price(html)
    prices = {
      "-80" => 4,
      "-60" => 3,
      "-40" => 2,
      "-20" => 1,
      "-0"   => 0
    }
    
    position = html.match(/[0-9]{1} ([0-9-]+)/)[1]
    return prices[position]
  end
  
  



 
# open-uri RDoc: http://stdlib.rubyonrails.org/libdoc/open-uri/rdoc/index.html

 
  
  
end
