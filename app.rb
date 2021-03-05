require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/word')
also_reload('lib/**/*.rb')

get '/' do
  redirect to '/home'
end

get '/home' do
  erb(:'pages/home')
end

get '/words' do
  @words = Word.all()
  erb(:'pages/words')
end

post '/new' do
  Word.new(word: params[:word_input]).save()
  redirect to '/words'
end