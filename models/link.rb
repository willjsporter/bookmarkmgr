require 'data_mapper'
require  'dm-migrations'

class Link
  include DataMapper::Resource

  property :id,    Serial
  property :title, String
  property :url,   String
end



# Link.create(url: 'http://fakenews.com', title: "Fakenews")
