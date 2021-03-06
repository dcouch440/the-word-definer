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
  erb(:'pages/words/words')
end

post '/new' do
  Word.new(word: params[:word_input]).save()
  redirect to '/words'
end

get '/word/:id' do
  id = params[:id].to_i()
  @word = Word.find(id)
  @definitions = Definition.find_definitions(g_id: id)
  erb(:'pages/words/word')
end

post '/word/:id' do
  id = params[:id].to_i()
  @word = Word.find(id)
  @definitions = Definition
    .new(
      definition: params[:definition_input],
      global_id: id
    )
    .save()
    .find_definitions(g_id: id)
  erb(:'pages/words/word')
end

get '/word/:id/definition/:def_id' do
  g_id = params[:id].to_i()
  d_id = params[:def_id].to_i()
  @word = Word.find(g_id)
  @definition = Definition.find_definition(g_id: g_id, d_id: d_id)
  erb(:'pages/definitions/definition')
end

delete('/word/:id/:def_id') do
  g_id = params[:id].to_i()
  d_id = params[:def_id].to_i()
  @word = Word.find(g_id)
  @definition = Definition.find_definition(g_id: g_id, d_id: d_id)
  @definition.delete(g_id: g_id, d_id: d_id)
  redirect to "/word/#{g_id}"
end

