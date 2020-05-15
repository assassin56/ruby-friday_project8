require('sinatra')
require('sinatra/reloader')
require('./lib/')
require('./lib/')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  
end