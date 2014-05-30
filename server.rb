require 'sinatra'
require 'csv'

get '/' do
  @articles = []

  CSV.foreach('articles.csv') do |article|
    title = article[0]
    url = article[1]
    description = article[2]
    @articles << {title: title, url: url, description: description}
  end

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
