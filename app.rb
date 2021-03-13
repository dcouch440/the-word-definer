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

post '/words' do
  Word.new(word: params[:word_input]).save()
  @words = Word.all()
  erb(:'pages/words/words')
end

patch '/words/:id' do
  id = params[:id].to_i()
  @word = Word.find(id)
  @word.update(new_word: params[:update_word])
  @words = Word.all()
  redirect to '/words'
end

delete '/words/:id' do
  id = params[:id].to_i()
  @word = Word.find(id)
  @word.delete(id)
  redirect to '/words'
end

get '/words/:id/edit' do
  id = params[:id].to_i()
  @word = Word.find(id)
  erb(:'pages/words/word_change')
end

get '/words/:id/definitions/new' do
  id = params[:id].to_i()
  @word = Word.find(id)
  erb(:'pages/words/definition_new')
end

post '/words/:id/definitions' do
  id = params[:id].to_i()
  definition = Definition.new(definition: params[:definition_input], glob_id: id).save()
  redirect to "/words/#{id}/definitions/#{definition.id}"
end

get '/words/:id/definitions/:did/edit' do
  id = params[:id].to_i()
  definition_id = params[:did].to_i()
  @word = Word.find(id)
  @definition = Definition.find_definition(definition_id)
  erb(:'pages/words/definition_change')
end

get '/words/:id/definitions/:did' do
  glob_id = params[:id].to_i()
  definition_id = params[:did].to_i()
  @word = Word.find(glob_id)
  @definition = Definition.find_definition(definition_id)
  erb(:"pages/words/definition")
end

patch '/words/:id/definitions/:did' do
  glob_id = params[:id].to_i()
  definition_id = params[:did].to_i()
  @word = Word.find(glob_id)
  @definition = Definition.find_definition(definition_id)
  @definition.update(new_definition: params[:update_definition])
  redirect to "/words/#{glob_id}/definitions/#{definition_id}"
end

delete '/words/:id/definitions/:did' do
  id = params[:id].to_i()
  definition_id = params[:did].to_i()
  @definition = Definition.find_definition(definition_id)
  @definition.delete(definition_id)
  redirect to "/words"
end
