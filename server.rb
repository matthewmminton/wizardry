require 'sinatra'

get '/' do
  @articles = File.readlines('articles')
  erb :index
end
