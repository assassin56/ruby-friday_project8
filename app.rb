require('sinatra')
require('sinatra/reloader')
require('./lib/class_dictionary')
# require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')


get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end

get('/') do
  @dictionary = Class_Dictionary.all
  erb(:dictionary)
end

get('/dictionary') do
  @dictionary = Class_Dictionary.all
  erb(:dictionary)
end

get('/word/new') do
  erb(:new_word)
end

