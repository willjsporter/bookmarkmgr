require 'sinatra/base'
# require 'data_mapper'
# require  'dm-migrations'
# require_relative './models/link'
# require_relative './models/tag'
require_relative 'data_mapper_setup'


ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @link_ary=[]
    @links = Link.all
    @links.each do |link|
        @link_ary << "#{link.title} - #{link.tags}"
    end
    # @tag_ary=[]
    # @tags = Tag.all
    # @tags.each do |tag|
    #     @tag_ary << tag.tagname#.to_s
    # end

    erb :links
  end

  get '/links/new' do
    erb :newlink
  end

  post '/links' do
    link=Link.create(:title=>params[:title], :url=>params[:url])
    tag=Tag.create(tagname: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  # get '/tags/new' do
  #   erb :newtag
  # end
  #
  # post '/tags' do
  #   Tag.create(:tagname=>params[:tagname])
  #   redirect '/links'
  # end

  run! if app_file == $PROGRAM_NAME
end
