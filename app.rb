require('sinatra')
require('sinatra/reloader')
require('./lib/class_dictionary')
# require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @dictionary = Class_Dictionary.all
  erb(:class_dictionary)
end