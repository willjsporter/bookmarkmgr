require 'data_mapper'
require  'dm-migrations'

class Tag
  include DataMapper::Resource

  property :id,    Serial
  property :tagname, String
  has n, :links, through: Resource
end



# Link.create(url: 'http://fakenews.com', title: "Fakenews")
