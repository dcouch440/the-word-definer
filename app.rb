require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/word'
require './lib/definition'
also_reload 'lib/**/*.rb'

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
  @definition = Definition.find_definition(id)
  erb(:'pages/words/word')
end

get '/word/:id/change' do
  id = params[:id].to_i()
  @word = Word.find(id)
  @definition = Definition.find_definition(id)
  erb(:'pages/words/definition_change')
end

delete '/word/:id/delete' do
  id = params[:id].to_i()
  @word = Word.find(id)
  @word.delete(id)
  redirect to '/words'
end

post '/word/:id' do
  id = params[:id].to_i()
  @word = Word.find(id)
  Definition.new(definition: params[:definition_input], glob_id: id).save()
  @definition = Definition.find_definition(id)
  redirect to "/word/#{id}"
end

patch '/word/:id/change' do
  glob_id = params[:id].to_i()
  @word = Word.find(glob_id)
  @definition = Definition.find_definition(glob_id)
  @definition.update(new_definition: params[:update_definition])
  redirect to "/words"
end