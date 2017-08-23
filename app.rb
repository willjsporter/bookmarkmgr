require 'sinatra/base'
require_relative './models/link'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @link_ary=[]
    @links = Link.all
    @links.each do |link|
        @link_ary << link.title.to_s
    end
    erb :links
  end

  run! if app_file == $PROGRAM_NAME
end
