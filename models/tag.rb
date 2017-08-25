require 'data_mapper'
require  'dm-migrations'

class Tag
  include DataMapper::Resource

  property :id,    Serial
  property :tagname, String
  property :title,   String
end





# Link.create(url: 'http://fakenews.com', title: "Fakenews")
