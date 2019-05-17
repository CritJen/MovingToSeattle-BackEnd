class LoadDataController < ActionController::API
    yelp_url = 'https://api.yelp.com/v3/businesses/search?location=seattle'
    headers_hash = {Authorization: 'Bearer 6Yw7w9D_uRNibUpcvPZu8mQ7QTMci8UEiglW7OgOovHlcRL4pG2GFiYZaU9CFwqKU0Di8UmdnHa-RUEOt-xuRpfGZtEwHJfDmPaS2MbiH8g5FlPKyRTT95pCxtPdXHYx'}
   data = JSON.parse(RestClient.get(yelp_url, headers=headers_hash))
   
#    def createArticle(biz)
#     latitude = biz["coordinates"]["latitude"]
#     longitude = biz["coordinates"]["longitude"]
#     name = biz["name"]
#     tags = []

#     biz["categories"].each do |cat|
#         tags << cat["alias"]
#     end

#     newArticle = Article.create()
#     newArticle
#    end

   data["businesses"].each do |biz|
    latitude = biz["coordinates"]["latitude"]
    longitude = biz["coordinates"]["longitude"]
    name = biz["name"]
    tags = []

    biz["categories"].each do |cat|
        tags << cat["alias"]
    end

    newLocation = Location.create(latitude: latitude, longitude: longitude, name: name, tags: tags, category_id: 1)
end
end
