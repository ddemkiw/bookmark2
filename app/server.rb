require 'sinatra'
require 'data_mapper'
require './app/model/link' 

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
 

DataMapper.finalize

DataMapper.auto_upgrade!

class Bookmark < Sinatra::Base
  
  get '/' do
    'Hello bookmark!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
