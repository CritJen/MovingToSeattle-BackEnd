class LoadDataController < ApplicationController

    # yelp_url = 'https://api.yelp.com/v3/businesses/search?location=seattle'
    yelp_url = "https://api.yelp.com/v3/businesses/search?location=seattle"

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

   self.createLocation(yelp_url, 1)


#    self.createLocation(yelp_url, 1)

   urls.each do |category|
    self.createLocation(category[:url], category[:id])
    end


#    data["businesses"].each do |biz|
#     latitude = biz["coordinates"]["latitude"]
#     longitude = biz["coordinates"]["longitude"]
#     name = biz["name"]
#     tags = []

#     biz["categories"].each do |cat|
#         tags << cat["alias"]
#     end

#     newLocation = Location.create(latitude: latitude, longitude: longitude, name: name, tags: tags, category_id: 1)
# end
end
