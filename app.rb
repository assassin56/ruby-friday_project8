require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

# a test #

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end

# methods for the homepage #

get('/') do
  @dictionary = Word.all
  erb(:dictionary)
end

get('/dictionary') do
  @dictionary = Word.all
  erb(:dictionary)
end


# methods pertaining to particular words #

get('/word/new') do
  erb(:new_word)
end

post('/word/new') do
  name = params[:name]
  class_dict = Word.new(:name)
  class_dict.save()
  @dictionary = Word.all()
  erb(:new_word)
end

get('/word/:id') do
  @dictionary = Word.find(params[:id].to_i())
  erb(:word)
end

patch('/word/:id') do
  @dictionary = Word.find(params[:id].to_i())
  @dictionary.update(params[:name])
  @dictionary = Word.all
  erb(:word)
end

delete('/word/:id') do
  @dictionary = Word.find(params[:id].to_i())
  @dictionary.delete()
  @dictionary = Word.all
  erb(:word)
end

get('/word/search') do
  @dictionary = Word.search(params[:name])
  erb(:search)
end

# methods pertaining to word definitions #

post('/word/:id/definition') do
  @dictionary = Word.find(params[:id].to_i())
  definition = Definition.find(params[:def_id].to_i())
  definition.save()
  erb(:defintion)
end

patch('/word/:id/defintion/:definition_id') do
  @dictionary = Word.find(params[:id].to_i())
  definition = Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

delete('/word/:id/defintion/:defintion_id') do
  defintion = Definition.find(params[:definition_id].to_i())
  definition.delete()
  @dicionary = Word.find(params[:id].to_i())
  erb(:word)
end