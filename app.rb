require('sinatra')
require('sinatra/reloader')
require('./lib/class_dictionary')
require('./lib/class_definitions')
require('pry')
also_reload('lib/**/*.rb')

# a test #

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end

# methods for the homepage #

get('/') do
  @dictionary = Class_Dictionary.all
  erb(:dictionary)
end

get('/dictionary') do
  @dictionary = Class_Dictionary.all
  erb(:dictionary)
end

# methods pertaining to particular words #

get('/word/new') do
  erb(:new_word)
end

get('/word/:id') do
  @dictionary = Class_Dictionary.find(params[:id].to_i())
  erb(:word)
end

patch('/word/:id') do
  @dictionary = Class_Dictionary.find(params[:id].to_i())
  @dictionary.update(params[:name])
  @dictionary = Class_Dictionary.all
  erb(:word)
end

delete('/word/:id') do
  @dictionary = Class_Dictionary.find(params[:id].to_i())
  @dictionary.delete()
  @dictionary = Class_Dictionary.all
  erb(:word)
end

get('/word/search') do
  @dictionary = Class_Dictionary.search(params[:name])
  erb(:search)
end

# methods pertaining to word definitions #

post('/word/:id/definition') do
  @dictionary = Class_Dictionary.find(params[:id].to_i())
  definition = Class_Definition.find(params[:def_id].to_i())
  definition.save()
  erb(:defintion)
end

patch('/word/:id/defintion/:definition_id') do
  @dictionary = Class_Dictionary.find(params[:id].to_i())
  definition = Class_Definition.find(params[:definition_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

delete('/word/:id/defintion/:defintion_id') do
  defintion = Class_Definition.find(params[:definition_id].to_i())
  definition.delete()
  @dicionary = Class_Dictionary.find(params[:id].to_i())
  erb(:word)
end