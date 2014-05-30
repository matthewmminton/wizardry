require 'sinatra'
require 'csv'

get '/' do
  @articles = File.readlines('articles.csv')
  erb :index
end

post '/wizards' do
  url = params['article_url']
  title = params['article_title']
  description = params['article_text']

  CSV.open('articles.csv', 'wb') do |csv|
    csv << [title, url, description]
  end

  redirect '/'
end
