require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  redirect to '/home'
end

get('/home') do
  erb(:'pages/home')
end

get('/words') do
  @words = Word.all()
  erb(:'pages/words/words')
end

post('/new') do
  Word.new(word: params[:word_input]).save()
  redirect to '/words'
end

get('/word/:id') do
  id = params[:id].to_i()
  @word = Word.find(id)
  @definitions = Definition.find_definition(glob_id: id)
  erb(:'pages/words/word')
end

get('/word/:id/change') do
  id = params[:id].to_i()
  @word = Word.find(id)
  @definitions = Definition.find_definition(glob_id: id)
  erb(:'pages/words/definition_change')
end

delete('/word/:id/delete') do
  id = params[:id].to_i()
  @word = Word.find(id)
  @word.delete(glob_id: id)
  redirect to '/words'
end

post('/word/:id') do
  id = params[:id].to_i()
  @word = Word.find(id)
  Definition
    .new(
      definition: params[:definition_input],
      glob_id: id
    )
    .save()
  @definitions = Definition.find_definition(glob_id: id)
  redirect to "/word/"
end

patch('/word/:id/change') do
  glob_id = params[:id].to_i()
  @word = Word.find(glob_id)
  @definition = Definition.find_definition(glob_id: glob_id)
  @definition.update(new_definition: params[:update_definition])
  redirect to "/words"
end