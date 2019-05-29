class LoadDataController < ApplicationController

    # yelp_url = 'https://api.yelp.com/v3/businesses/search?location=seattle'
    yelp_url = "https://api.yelp.com/v3/businesses/search?location=seattle"
    zillow_url = "https://www.seattlerentals.com/map_listings?_=1559063101668"

    @@headers_hash = {Authorization: 'Bearer 6Yw7w9D_uRNibUpcvPZu8mQ7QTMci8UEiglW7OgOovHlcRL4pG2GFiYZaU9CFwqKU0Di8UmdnHa-RUEOt-xuRpfGZtEwHJfDmPaS2MbiH8g5FlPKyRTT95pCxtPdXHYx'}

    # urls = []

    # search_terms = ["restaurants", "active", "arts"]

    # search_terms.each do |term|
    #     urls << {url: "https://api.yelp.com/v3/businesses/search?location=seattle&categories=#{term}, All"}
    # end

    urls = [{url: 'https://api.yelp.com/v3/businesses/search?location=seattle&categories=restaurants, All', id: 1}, {url:"https://api.yelp.com/v3/businesses/search?location=seattle&categories=active, All", id: 2}, {url:"https://api.yelp.com/v3/businesses/search?location=seattle&categories=arts, All", id: 3}]

   def self.createLocation(url, id)
    data = JSON.parse(RestClient.get(url, headers=@@headers_hash))
    data["businesses"].each do |biz|
        latitude = biz["coordinates"]["latitude"]
        longitude = biz["coordinates"]["longitude"]
        name = biz["name"]
        tags = []
    
        biz["categories"].each do |cat|
            tags << cat["alias"]
        end
    
        newLocation = Location.create(latitude: latitude, longitude: longitude, name: name, tags: tags, category_id: id)
    end
   end


   urls.each do |category|
    self.createLocation(category[:url], category[:id])
    end

   
   propertyData = JSON.parse(RestClient.get(zillow_url))
    propertyData["ads"].each do |property|
        latitude = property["latitude"]
        longitude = property["longitude"]
        name = property["name"]
        rent = property["monthly_rent"].split("to")
        monthly_rent = rent[0].split(//).map {|x| x[/\d+/]}.compact.join("").to_i
        bedroom = property["bedroom"]
        bathroom = property["bathroom"]
        address = property["address"]
        newProperty = Property.create(latitude: latitude, longitude: longitude, name: name, bedroom: bedroom, bathroom: bathroom, address: address, monthly_rent: monthly_rent)
    end


#    self.createLocation(yelp_url, 1)



end
