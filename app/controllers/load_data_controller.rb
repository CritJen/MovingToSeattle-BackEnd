class LoadDataController < ApplicationController

    yelp_url = "https://api.yelp.com/v3/businesses/search?location=seattle"
    properties_url = "https://www.seattlerentals.com/map_listings?_=1559063101668"

    @@headers_hash = {Authorization: 'Bearer 6Yw7w9D_uRNibUpcvPZu8mQ7QTMci8UEiglW7OgOovHlcRL4pG2GFiYZaU9CFwqKU0Di8UmdnHa-RUEOt-xuRpfGZtEwHJfDmPaS2MbiH8g5FlPKyRTT95pCxtPdXHYx'}


    urls = [{url: 'https://api.yelp.com/v3/businesses/search?location=seattle&categories=restaurants, All&limit=50', id: 1, times: 19},
     {url:"https://api.yelp.com/v3/businesses/search?location=seattle&categories=active, All&limit=50", id: 2, times: 3}, {url:"https://api.yelp.com/v3/businesses/search?location=seattle&categories=arts, All&limit=50", id: 3, times: 5}, {url:"https://api.yelp.com/v3/businesses/search?location=seattle&categories=beautysvc, All&limit=50", id: 4, times: 3}, {url:"https://api.yelp.com/v3/businesses/search?location=seattle&categories=health, All&limit=50", id: 5, times: 3}]

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
        if !latitude.nil? && !longitude.nil?
        newLocation = Location.find_or_create_by(latitude: latitude, longitude: longitude, name: name, tags: tags, category_id: id)
        end
    end
   end

#Iterates over the api endpoints the prescribed number of times to seed data
   urls.each do |category|
        offset = 0
        rounds = category[:times]
        rounds.times do
            url = category[:url] + "&offset=#{offset}"
            self.createLocation(url, category[:id])
            offset += 50
        end
    end

   
   propertyData = JSON.parse(RestClient.get(properties_url))
    propertyData["ads"].each do |property|
        latitude = property["latitude"]
        longitude = property["longitude"]
        name = property["name"]
        if property["monthly_rent"]
            rent = property["monthly_rent"].split("to")
            monthly_rent = rent[0].split(//).map {|x| x[/\d+/]}.compact.join("").to_i
        else 
            monthly_rent = "unknown"
        end
        bedroom = property["bedroom"]
        bathroom = property["bathroom"]
        split_address = property["address"].split("<br/>")
        address = split_address.first
        link_id = property["id"]
        if property["neighborhood"].empty?
            neighborhood = split_address.last.split(",").first.split(" ").join("-")
        else
            neighborhood = property["neighborhood"].split(":").last.split(" ").join("-")
        end
        newProperty = Property.find_or_create_by(latitude: latitude, longitude: longitude, name: name, bedroom: bedroom, bathroom: bathroom, address: address, monthly_rent: monthly_rent, neighborhood: neighborhood, link_id: link_id)
    end


#    self.createLocation(yelp_url, 1)



end
