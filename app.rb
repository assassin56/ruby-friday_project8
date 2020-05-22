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
  @names = Word.all
  erb(:dictionary)
end

get('/dictionary') do
  @names = Word.all
  erb(:dictionary)
end

post('/dictionary') do
  name = params[:name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  @names = Word.all()
  erb(:dictionary)
end

get('/dictionary/new') do
  erb(:new_word)
end

# methods pertaining to particular words #

get('/words/:id') do
  @names = Word.find(params[:id].to_i())
  erb(:word)
end

# patch('/words/:id') do
#   @names = Word.find(params[:id].to_i())
#   @names.update(params[:name])
#   @names = Word.all
#   erb(:word)
# end

# delete('/words/:id') do
#   @names = Word.find(params[:id].to_i())
#   @names.delete()
#   @names = Word.all
#   erb(:word)
# end

# get('/words/search') do
#   @dictionary = Word.search(params[:name])
#   erb(:search)
# end

# # methods pertaining to word definitions #

# post('/words/:id/definitions') do
#   @dictionary = Word.find(params[:id].to_i())
#   definition = Definition.find(params[:def_id].to_i())
#   definition.save()
#   erb(:defintion)
# end

# patch('/words/:id/defintions/:definition_id') do
#   @dictionary = Word.find(params[:id].to_i())
#   definition = Definition.find(params[:definition_id].to_i())
#   definition.update(params[:name], @word.id)
#   erb(:word)
# end

# delete('/words/:id/defintions/:defintion_id') do
#   defintion = Definition.find(params[:definition_id].to_i())
#   definition.delete()
#   @dicionary = Word.find(params[:id].to_i())
#   erb(:word)
# end