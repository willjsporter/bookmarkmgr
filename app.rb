require 'sinatra/base'
require 'data_mapper'
require  'dm-migrations'
DataMapper.setup(:default, ENV['DATABASE_URL']||"postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
require_relative './models/link'
require_relative './models/tag'
# require 'data_mapper_setup'
DataMapper.finalize
DataMapper.auto_upgrade!

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @link_ary=[]
    @links = Link.all
    @links.each do |link|
        @link_ary << link.title#.to_s
    end
    @tag_ary=[]
    @tags = Tag.all
    @tags.each do |tag|
        @tag_ary << tag.tagname#.to_s
    end

    erb :links
  end

  get '/links/new' do
    erb :newlink
  end

  post '/links' do
    Link.create(:title=>params[:title], :url=>params[:url])
  end

  get '/tags/new' do
    erb :newtag
  end

  post '/tags' do
    Tag.create(:title=>params[:title], :tagname=>params[:tagname])
    redirect '/links'
  end

  run! if app_file == $PROGRAM_NAME
end
