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
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

post('/words') do
  name = params[:name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

# methods pertaining to particular words #

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @words = Word.all
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:new_word])
  @words = Word.all
  erb(:words)
end

delete('/words/:id') do
  @words = Word.find(params[:id].to_i())
  @words.delete()
  @words = Word.all
  erb(:words)
end

# methods pertaining to word definitions #

get('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:id].to_i())
  erb(:definition)
end

get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.new({:definition => (params[:new_definition]), :word_id => @word.id, :id => nil})
  @definition.save
  erb(:word)
end


patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  @definition = Definition.find(params[:definition_id].to_i())
  @definition = Definition.update(params[:edit_definition], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:defintion_id') do
  @definition = Definition.find(params[:definition_id].to_i())
  @definition.delete()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end