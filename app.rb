require 'sinatra/base'
require_relative './models/link'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @link_ary=[]
    @links = Link.all
    @links.each do |link|
        @link_ary << link.title.to_s
    end
    erb :links
  end

  get '/links/new' do
    erb :newlink
  end

  post '/links' do
    Link.create(:title=>params[:title], :url=>params[:url])
  end

  run! if app_file == $PROGRAM_NAME
end
