require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/word')
require('./lib/definition')
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

get '/word/:id' do
  @id = params[:id].to_i()
  @word = Word.find(@id)
  @definitions = Definition.find(@id)
  erb(:'pages/word')
end

post '/word/:id' do
  @word = Word.find(params[:id].to_i())
  @definitions = Definition
    .new(
      definition: params[:definition_input],
      global_id: params[:id].to_i()
    )
    .save()
    .find_definitions(global_id: params[:id].to_i())
  erb(:'pages/word')
end

get '/word/:id/:word_id'
  @id = params[:id].to_i()
  @word = Word.find(@id)
  @definition_word = Definition.find_definitions(global_definitions: @id)
end