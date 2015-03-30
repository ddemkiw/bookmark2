require 'sinatra'
require 'data_mapper'
require './app/models/link' 

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
 

DataMapper.finalize

DataMapper.auto_upgrade!

class Bookmark < Sinatra::Base
  
get '/' do
  @links = Link.all
  erb :index
end

post '/links' do
  url = params["url"]
  title = params["title"]
  Link.create(:url => url, :title => title)
  redirect to('/')
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
